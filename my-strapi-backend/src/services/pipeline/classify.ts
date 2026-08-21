import type { NewsArticle, PipelineConfig, RewrittenArticle } from './types';
import { fetchJson, fetchText, isGeminiQuotaError, PipelineHttpError, sleep } from './retry';

interface GeminiResponse {
  candidates?: Array<{
    content?: { parts?: Array<{ text?: string }> };
  }>;
  error?: { message?: string };
}

const DEFAULT_CATEGORIES = ['AI', 'Technology', 'Ethics', 'Society'];

const MODEL_FALLBACKS = [
  'gemini-2.5-flash',
  'gemini-flash-latest',
  'gemini-2.5-flash-lite',
];

const MIN_REWRITE_WORDS = 650;

const DEFAULT_REWRITE_PROMPT = `You are a senior SEO editor and staff writer for The Humanist AI, a publication about keeping humans at the center of technology.
Write a Google-ready news analysis, not a 4-paragraph summary. Voice: clear, expert, people-first. No clickbait. No keyword stuffing. No invented facts, quotes, numbers, or events.
Google SEO requirements:
- rewrittenTitle: unique, specific, primary keyword near the front, 50–65 characters (max 90)
- excerpt: meta description, 140–160 characters, includes the primary topic, no quotes wrapping it
- rewrittenBody: AT LEAST ${MIN_REWRITE_WORDS} words (target 750–1000). Must stand alone if the source is a short blurb.
Structure rewrittenBody as markdown:
1. Opening 2–3 paragraphs that state what happened, who is involved, and why it matters
2. At least four ## H2 sections (what changed, background/context, human and enterprise impact, what to watch next)
3. Optional ### H3s where useful
4. Close with a short "What this means" takeaway
5. Optional ## FAQ with 2–3 real questions readers would search
Each H2 needs several full paragraphs (not one-liners). Explain implications for workers, customers, and organizations using only facts in the source plus careful analysis of those facts.`;

export function countWords(text: string): number {
  return (text || '')
    .replace(/[#*_`>]/g, ' ')
    .trim()
    .split(/\s+/)
    .filter(Boolean).length;
}

function geminiModels(): string[] {
  const preferred = (process.env.GEMINI_MODEL || '').trim();
  return [...new Set([preferred, ...MODEL_FALLBACKS].filter(Boolean))];
}

export function parseGeminiJson<T>(raw: string): T {
  const trimmed = raw.trim().replace(/^```(?:json)?\s*/i, '').replace(/\s*```$/, '');
  return JSON.parse(trimmed) as T;
}

export function isGeminiMockMode(config?: PipelineConfig | null) {
  return Boolean(config?.geminiMockMode);
}

function extractReadableText(html: string): string {
  const withoutJunk = html
    .replace(/<script[\s\S]*?<\/script>/gi, ' ')
    .replace(/<style[\s\S]*?<\/style>/gi, ' ')
    .replace(/<noscript[\s\S]*?<\/noscript>/gi, ' ')
    .replace(/<!--[\s\S]*?-->/g, ' ');
  const main =
    withoutJunk.match(/<article[\s\S]*?<\/article>/i)?.[0] ||
    withoutJunk.match(/<main[\s\S]*?<\/main>/i)?.[0] ||
    withoutJunk;
  return main
    .replace(/<br\s*\/?>/gi, '\n')
    .replace(/<\/(p|div|h1|h2|h3|li|blockquote)>/gi, '\n')
    .replace(/<[^>]+>/g, ' ')
    .replace(/&nbsp;/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/\s+/g, ' ')
    .trim();
}

async function ensureSourceBody(article: NewsArticle): Promise<NewsArticle> {
  const existing = `${article.description || ''} ${article.content || ''}`;
  if (countWords(existing) >= 220) return article;
  try {
    const res = await fetchText(article.url, {}, 15000);
    if (res.status >= 400 || !res.text) return article;
    const extracted = extractReadableText(res.text);
    if (countWords(extracted) < 80) return article;
    return { ...article, content: extracted.slice(0, 14000) };
  } catch {
    return article;
  }
}

function jsonShapeBlock(categories: string) {
  return `Return ONLY JSON. No markdown fences. No preamble.

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
If relevant is false, still return JSON but leave rewrittenTitle, excerpt, and rewrittenBody as empty strings.`;
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
        generationConfig: {
          responseMimeType: 'application/json',
          temperature: 0.65,
          maxOutputTokens: 8192,
        },
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
  tooShort?: number;
  raw?: string;
}

interface CombinedGeminiJson {
  relevant?: boolean;
  category?: string;
  reason?: string;
  rewrittenTitle?: string;
  rewrittenBody?: string | string[];
  title?: string;
  excerpt?: string;
  content?: string | string[];
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

function toRewritten(
  parsed: CombinedGeminiJson,
  category: string,
  reason?: string
): CombinedGeminiResult {
  const title = (parsed.rewrittenTitle || parsed.title || '').trim();
  const body = parsed.rewrittenBody ?? parsed.content;
  const content = Array.isArray(body) ? body.join('\n\n') : String(body || '').trim();
  const excerpt = (parsed.excerpt || content).replace(/\s+/g, ' ').trim().slice(0, 160);

  if (!title || !content) {
    return { relevant: true, category, parseFailed: true, rewritten: null };
  }

  const words = countWords(content);
  if (words < MIN_REWRITE_WORDS) {
    return { relevant: true, category, tooShort: words, rewritten: { title, excerpt, content } };
  }

  return {
    relevant: true,
    category,
    reason,
    rewritten: { title, excerpt, content },
  };
}

export async function classifyAndRewrite(
  article: NewsArticle,
  config: PipelineConfig,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>
): Promise<CombinedGeminiResult> {
  if (isGeminiMockMode(config)) {
    return MOCK_RESULT;
  }

  const source = await ensureSourceBody(article);
  const categories = (config.categories && config.categories.length
    ? config.categories
    : DEFAULT_CATEGORIES
  ).join(', ');
  const extraGuide = (config.rewritePrompt || '').trim();
  const rewriteGuide = extraGuide
    ? `${DEFAULT_REWRITE_PROMPT}\n\nAdditional editor notes:\n${extraGuide}`
    : DEFAULT_REWRITE_PROMPT;

  const prompt = `Act as a senior Google SEO expert and news editor. Classify AND write a full article for The Humanist AI in one response.
${jsonShapeBlock(categories)}

${rewriteGuide}

HARD REQUIREMENT: if relevant is true, rewrittenBody MUST contain at least ${MIN_REWRITE_WORDS} English words (count them). A 150–300 word summary is a failed response. Do not mention that this is a rewrite.

SOURCE TITLE: ${source.title}
SOURCE NAME: ${source.sourceName}
SOURCE URL: ${source.url}
SOURCE DESCRIPTION: ${source.description}
SOURCE CONTENT: ${source.content}`;

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

  let result = toRewritten(parsed, category, parsed.reason);
  if (result.parseFailed) {
    result.raw = raw.slice(0, 4000);
    return result;
  }

  if (result.tooShort && result.rewritten) {
    const expandPrompt = `The previous draft was only ${result.tooShort} words. That fails Google SEO length. Expand it to at least ${MIN_REWRITE_WORDS} words (target 750–1000) without inventing facts.
Keep the same story and JSON shape. rewrittenBody needs four or more ## sections and full paragraphs under each.
${jsonShapeBlock(categories)}
${rewriteGuide}

DRAFT TITLE: ${result.rewritten.title}
DRAFT EXCERPT: ${result.rewritten.excerpt}
DRAFT BODY: ${result.rewritten.content}

SOURCE TITLE: ${source.title}
SOURCE CONTENT: ${source.content}`;

    const expandedRaw = await geminiGenerateText(expandPrompt, onRetry);
    try {
      const expanded = parseGeminiJson<CombinedGeminiJson>(expandedRaw);
      result = toRewritten(expanded, category, expanded.reason);
      if (result.parseFailed || result.tooShort) {
        result.raw = expandedRaw.slice(0, 4000);
      }
    } catch {
      return {
        relevant: true,
        category,
        tooShort: result.tooShort,
        raw: expandedRaw.slice(0, 4000),
        rewritten: null,
      };
    }
  }

  if (result.tooShort) {
    return {
      relevant: true,
      category,
      tooShort: result.tooShort,
      raw: result.raw,
      rewritten: null,
    };
  }

  return result;
}
