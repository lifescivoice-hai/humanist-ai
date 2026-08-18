import type { Classification, NewsArticle, PipelineConfig } from './types';
import { fetchJson, PipelineHttpError, withRetry } from './retry';

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

function geminiModels(): string[] {
  const preferred = (process.env.GEMINI_MODEL || '').trim();
  return [...new Set([preferred, ...MODEL_FALLBACKS].filter(Boolean))];
}

export function parseGeminiJson<T>(raw: string): T {
  const trimmed = raw.trim().replace(/^```(?:json)?\s*/i, '').replace(/\s*```$/, '');
  return JSON.parse(trimmed) as T;
}

export async function geminiGenerateJson<T>(
  prompt: string,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>
): Promise<T> {
  const apiKey = process.env.GEMINI_API_KEY;
  if (!apiKey) {
    throw new Error('GEMINI_API_KEY is not set');
  }

  const models = geminiModels();
  let lastError: Error = new Error('Gemini request failed');

  for (const model of models) {
    const url = `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent`;
    try {
      const data = await withRetry(
        () =>
          fetchJson<GeminiResponse>(url, {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              'x-goog-api-key': apiKey,
            },
            body: JSON.stringify({
              contents: [{ parts: [{ text: prompt }] }],
              generationConfig: { responseMimeType: 'application/json', temperature: 0.4 },
            }),
          }),
        { retries: 3, minDelayMs: 8000, onRetry }
      );

      if (data.error?.message) {
        throw new Error(data.error.message);
      }

      const text = data.candidates?.[0]?.content?.parts?.map((p) => p.text || '').join('') || '';
      if (!text) {
        throw new Error('Gemini returned an empty response');
      }

      return parseGeminiJson<T>(text);
    } catch (err) {
      lastError = err instanceof Error ? err : new Error(String(err));
      if (lastError instanceof PipelineHttpError && lastError.status === 404) {
        continue;
      }
      throw lastError;
    }
  }

  throw lastError;
}

export async function classify(
  article: NewsArticle,
  config: PipelineConfig,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>
): Promise<Classification> {
  const categories = (config.categories && config.categories.length
    ? config.categories
    : DEFAULT_CATEGORIES
  ).join(', ');

  return geminiGenerateJson<Classification>(
    `You classify news for a human-centered AI publication.
Return JSON: { "relevant": boolean, "category": string, "reason": string }.
relevant=true only if the story is about AI, technology, digital society, ethics, or human impact of tech.
category MUST be one of: ${categories}.
Skip celebrity gossip, sports scores, and generic finance unless they are about AI.

Title: ${article.title}
Source: ${article.sourceName}
Description: ${article.description}
Content: ${article.content.slice(0, 1200)}`,
    onRetry
  );
}
