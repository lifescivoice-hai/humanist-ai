import type { NewsArticle, PipelineConfig, RewrittenArticle } from './types';
import { fetchJson, isGeminiQuotaError, PipelineHttpError, sleep } from './retry';

interface GeminiResponse {
  candidates?: Array<{
    content?: { parts?: Array<{ text?: string }> };
  }>;
  error?: { message?: string };
}

const DEFAULT_CATEGORIES = ['AI', 'Technology', 'Ethics', 'Society'];

const MODEL_FALLBACKS = [
  'gemini-2.5-flash-lite',
  'gemini-2.5-flash',
  'gemini-flash-latest',
];

const DEFAULT_REWRITE_PROMPT = `Rewrite this news story for The Humanist AI, a publication about keeping humans at the center of technology.
Voice: clear, thoughtful, non-hype. No clickbait. No invented facts — only what is in the source.
- rewrittenTitle: original, under 90 characters
- excerpt: 1-2 sentences
- rewrittenBody: 4-8 short paragraphs, markdown allowed (## headings). Do not mention that this is a rewrite.`;

function geminiModels(): string[] {
  const preferred = (process.env.GEMINI_MODEL || '').trim();
  return [...new Set([preferred, ...MODEL_FALLBACKS].filter(Boolean))];
}

export function parseGeminiJson<T>(raw: string): T {
  const trimmed = raw.trim().replace(/^```(?:json)?\s*/i, '').replace(/\s*```$/, '');
  return JSON.parse(trimmed) as T;
}

function isMockMode() {
  return String(process.env.GEMINI_MOCK_MODE || '').toLowerCase() === 'true';
}

async function geminiRequest(model: string, prompt: string): Promise<string> {
  const apiKey = process.env.GEMINI_API_KEY;
  if (!apiKey) {
    throw new Error('GEMINI_API_KEY is not set');
  }

  const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent`;
  const data = await fetchJson<GeminiResponse>(
    url,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-goog-api-key': apiKey,
      },
      body: JSON.stringify({
        contents: [{ parts: [{ text: prompt }] }],
        generationConfig: { responseMimeType: 'application/json', temperature: 0.4 },
      }),
    },
    90000
  );

  if (data.error?.message) {
    throw new Error(data.error.message);
  }

  const text = data.candidates?.[0]?.content?.parts?.map((p) => p.text || '').join('') || '';
  if (!text) {
    throw new Error('Gemini returned an empty response');
  }
  return text;
}

/** One Gemini HTTP call, plus at most one retry (never on 429). 404 falls through to the next model. */
export async function geminiGenerateText(
  prompt: string,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>
): Promise<string> {
  const models = geminiModels();
  let lastError: Error = new Error('Gemini request failed');

  for (const model of models) {
    try {
      return await geminiRequest(model, prompt);
    } catch (err) {
      lastError = err instanceof Error ? err : new Error(String(err));
      if (isGeminiQuotaError(lastError)) {
        throw lastError;
      }
      const status = lastError instanceof PipelineHttpError ? lastError.status : 0;
      if (status === 404) {
        continue;
      }
      if (onRetry) await onRetry(1, lastError);
      await sleep(4000);
      try {
        return await geminiRequest(model, prompt);
      } catch (retryErr) {
        lastError = retryErr instanceof Error ? retryErr : new Error(String(retryErr));
        throw lastError;
      }
    }
  }

  throw lastError;
}

export interface CombinedGeminiResult {
  relevant: boolean;
  category: string;
  reason?: string;
  rewritten: RewrittenArticle | null;
  parseFailed?: boolean;
  raw?: string;
}

interface CombinedGeminiJson {
  relevant?: boolean;
  category?: string;
  reason?: string;
  rewrittenTitle?: string;
  rewrittenBody?: string;
  title?: string;
  excerpt?: string;
  content?: string;
}

const MOCK_RESULT: CombinedGeminiResult = {
  relevant: true,
  category: 'AI',
  reason: 'GEMINI_MOCK_MODE',
  rewritten: {
    title: '[MOCK] Human-centered AI draft',
    excerpt: 'Mock excerpt used when GEMINI_MOCK_MODE is true.',
    content:
      '## Mock article\n\nThis text is generated locally so pipeline testing does not call Gemini or burn free-tier quota.',
  },
};

export async function classifyAndRewrite(
  article: NewsArticle,
  config: PipelineConfig,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>
): Promise<CombinedGeminiResult> {
  if (isMockMode()) {
    return MOCK_RESULT;
  }

  const categories = (config.categories && config.categories.length
    ? config.categories
    : DEFAULT_CATEGORIES
  ).join(', ');
  const rewriteGuide = (config.rewritePrompt || '').trim() || DEFAULT_REWRITE_PROMPT;

  const prompt = `You classify AND rewrite news for The Humanist AI in a single response.
Return ONLY JSON. No markdown fences. No preamble.

JSON shape:
{
  "relevant": boolean,
  "category": string,
  "reason": string,
  "rewrittenTitle": string,
  "excerpt": string,
  "rewrittenBody": string
}

relevant=true only if the story is about AI, technology, digital society, ethics, or human impact of tech.
category MUST be one of: ${categories}.
Skip celebrity gossip, sports scores, and generic finance unless they are about AI.
If relevant is false, still return JSON but leave rewrittenTitle, excerpt, and rewrittenBody as empty strings.

${rewriteGuide}

SOURCE TITLE: ${article.title}
SOURCE NAME: ${article.sourceName}
SOURCE URL: ${article.url}
SOURCE DESCRIPTION: ${article.description}
SOURCE CONTENT: ${article.content}`;

  const raw = await geminiGenerateText(prompt, onRetry);

  let parsed: CombinedGeminiJson;
  try {
    parsed = parseGeminiJson<CombinedGeminiJson>(raw);
  } catch {
    return {
      relevant: false,
      category: 'AI',
      parseFailed: true,
      raw: raw.slice(0, 4000),
      rewritten: null,
    };
  }

  const relevant = Boolean(parsed.relevant);
  const category = String(parsed.category || 'AI').trim() || 'AI';
  if (!relevant) {
    return { relevant: false, category, reason: parsed.reason, rewritten: null };
  }

  const title = (parsed.rewrittenTitle || parsed.title || '').trim();
  const content = (parsed.rewrittenBody || parsed.content || '').trim();
  const excerpt = (parsed.excerpt || content).replace(/\s+/g, ' ').trim().slice(0, 280);

  if (!title || !content) {
    return {
      relevant: true,
      category,
      parseFailed: true,
      raw: raw.slice(0, 4000),
      rewritten: null,
    };
  }

  return {
    relevant: true,
    category,
    reason: parsed.reason,
    rewritten: { title, excerpt, content },
  };
}
