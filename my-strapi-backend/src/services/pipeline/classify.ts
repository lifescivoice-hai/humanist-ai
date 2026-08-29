import type { NewsArticle, PipelineConfig, RewrittenArticle } from './types';
import { fetchJson, fetchText, isGeminiQuotaError, PipelineHttpError, sleep } from './retry';

interface GeminiResponse {
  candidates?: Array<{
    content?: { parts?: Array<{ text?: string }> };
    finishReason?: string;
  }>;
  error?: { message?: string };
}

const DEFAULT_CATEGORIES = ['AI', 'Technology', 'Ethics', 'Society'];

const CLASSIFY_MODELS = [
  'gemini-2.5-flash',
  'gemini-flash-latest',
  'gemini-2.5-flash-lite',
];

/** Lite writes summaries. Do not use it for the article body. */
const WRITE_MODELS = ['gemini-2.5-flash', 'gemini-flash-latest'];

const MIN_REWRITE_WORDS = 800;

const WRITE_BRIEF = `You are a senior Google SEO editor and staff writer for The Humanist AI.
Write a complete news-analysis article, not a brief. People-first, no clickbait, no keyword stuffing.
Do not invent facts, quotes, numbers, or events. You may analyze implications of facts that are in the source.

HARD LENGTH RULE: the article body MUST be at least ${MIN_REWRITE_WORDS} English words (target 900–1200).
A 200–400 word summary is a failed response. Count before you stop.

Output ONLY markdown for the body. No JSON. No title line. No preamble. No word-count footnote.
Structure:
- 2–3 opening paragraphs (what happened, who, why it matters)
- At least five ## H2 sections, each with 2–4 full paragraphs (not one-liners)
  Suggested H2s: What changed; Background; Why it matters for people and organizations; Risks and open questions; What to watch next
- Optional ### H3s
- Close with ## What this means
- Optional ## FAQ with 2–3 search-style questions and 2–3 sentence answers`;

export function countWords(text: string): number {
  return (text || '')
    .replace(/[#*_`>]/g, ' ')
    .trim()
    .split(/\s+/)
    .filter(Boolean).length;
}

export function parseGeminiJson<T>(raw: string): T {
  const trimmed = raw.trim().replace(/^```(?:json)?\s*/i, '').replace(/\s*```$/, '');
  return JSON.parse(trimmed) as T;
}

export function isGeminiMockMode(config?: PipelineConfig | null) {
  return Boolean(config?.geminiMockMode);
}

function modelList(write: boolean): string[] {
  const preferred = (process.env.GEMINI_MODEL || '').trim();
  const fallbacks = write ? WRITE_MODELS : CLASSIFY_MODELS;
  const allowed = write && /lite/i.test(preferred) ? fallbacks : [...new Set([preferred, ...fallbacks].filter(Boolean))];
  return allowed;
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
  if (countWords(existing) >= 400) return article;
  try {
    const res = await fetchText(article.url, {}, 20000);
    if (res.status >= 400 || !res.text) return article;
    const extracted = extractReadableText(res.text);
    if (countWords(extracted) < 80) return article;
    return { ...article, content: extracted.slice(0, 16000) };
  } catch {
    return article;
  }
}

function sourceBlock(article: NewsArticle) {
  return `SOURCE TITLE: ${article.title}
SOURCE NAME: ${article.sourceName}
SOURCE URL: ${article.url}
SOURCE DESCRIPTION: ${article.description}
SOURCE CONTENT: ${article.content}`;
}

async function geminiRequest(
  model: string,
  prompt: string,
  json: boolean
): Promise<string> {
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
          ...(json ? { responseMimeType: 'application/json' } : {}),
          temperature: json ? 0.3 : 0.7,
          maxOutputTokens: json ? 1024 : 8192,
        },
      }),
    },
    120000
  );

  if (data.error?.message) {
    throw new Error(data.error.message);
  }

  const text = data.candidates?.[0]?.content?.parts?.map((p) => p.text || '').join('') || '';
  if (!text) {
    throw new Error('Gemini returned an empty response');
  }
  return text.trim();
}

async function geminiGenerateText(
  prompt: string,
  options: {
    json?: boolean;
    write?: boolean;
    onRetry?: (attempt: number, error: Error) => void | Promise<void>;
  } = {}
): Promise<string> {
  const models = modelList(Boolean(options.write));
  let lastError: Error = new Error('Gemini request failed');

  for (const model of models) {
    try {
      return await geminiRequest(model, prompt, Boolean(options.json));
    } catch (err) {
      lastError = err instanceof Error ? err : new Error(String(err));
      if (isGeminiQuotaError(lastError)) {
        throw lastError;
      }
      const status = lastError instanceof PipelineHttpError ? lastError.status : 0;
      if (status === 404) {
        continue;
      }
      if (options.onRetry) await options.onRetry(1, lastError);
      await sleep(4000);
      try {
        return await geminiRequest(model, prompt, Boolean(options.json));
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

interface ClassifyJson {
  relevant?: boolean;
  category?: string;
  reason?: string;
  rewrittenTitle?: string;
  title?: string;
  excerpt?: string;
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

function stripMarkdownFences(raw: string): string {
  return raw.trim().replace(/^```(?:markdown|md)?\s*/i, '').replace(/\s*```$/, '');
}

function bodyFromMarkdown(raw: string): string {
  let text = stripMarkdownFences(raw);
  text = text.replace(/^#\s+.+\n+/, '');
  return text.trim();
}

async function writeArticleMarkdown(
  source: NewsArticle,
  title: string,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>
): Promise<string> {
  const prompt = `${WRITE_BRIEF}

Working title (do not repeat as an H1): ${title}

${sourceBlock(source)}`;

  const raw = await geminiGenerateText(prompt, { write: true, onRetry });
  return bodyFromMarkdown(raw);
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

  const classifyPrompt = `Classify this news item for The Humanist AI. Return ONLY JSON.
{
  "relevant": boolean,
  "category": string,
  "reason": string,
  "rewrittenTitle": string,
  "excerpt": string
}
relevant=true only if the story is about AI, technology, digital society, ethics, or human impact of tech.
category MUST be one of: ${categories}.
rewrittenTitle: SEO title, 50–65 characters, keyword near the front, max 90.
excerpt: meta description, 140–160 characters.
If relevant is false, leave rewrittenTitle and excerpt empty.

${sourceBlock(source)}`;

  const classifyRaw = await geminiGenerateText(classifyPrompt, { json: true, onRetry });

  let classified: ClassifyJson;
  try {
    classified = parseGeminiJson<ClassifyJson>(classifyRaw);
  } catch {
    return {
      relevant: false,
      category: 'AI',
      parseFailed: true,
      raw: classifyRaw.slice(0, 4000),
      rewritten: null,
    };
  }

  const relevant = Boolean(classified.relevant);
  const category = String(classified.category || 'AI').trim() || 'AI';
  if (!relevant) {
    return { relevant: false, category, reason: classified.reason, rewritten: null };
  }

  const title = (classified.rewrittenTitle || classified.title || source.title).trim();
  const excerpt = (classified.excerpt || '').replace(/\s+/g, ' ').trim().slice(0, 160);
  if (!title) {
    return { relevant: true, category, parseFailed: true, raw: classifyRaw.slice(0, 2000), rewritten: null };
  }

  let content = await writeArticleMarkdown(source, title, onRetry);
  let words = countWords(content);

  if (words < MIN_REWRITE_WORDS) {
    const expandPrompt = `${WRITE_BRIEF}

The previous draft was only ${words} words. That is too short. Rewrite a FULL ${MIN_REWRITE_WORDS}–1200 word article on the same story. Do not copy the short draft. Output markdown body only.

Working title: ${title}

SHORT DRAFT (too short — expand, do not repeat as-is):
${content}

${sourceBlock(source)}`;

    content = bodyFromMarkdown(await geminiGenerateText(expandPrompt, { write: true, onRetry }));
    words = countWords(content);
  }

  if (words < MIN_REWRITE_WORDS) {
    return {
      relevant: true,
      category,
      tooShort: words,
      raw: content.slice(0, 4000),
      rewritten: null,
    };
  }

  return {
    relevant: true,
    category,
    reason: classified.reason,
    rewritten: {
      title,
      excerpt: excerpt || content.replace(/\s+/g, ' ').trim().slice(0, 160),
      content,
    },
  };
}
