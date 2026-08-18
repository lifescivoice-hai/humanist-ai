import type { NewsArticle, NewsSourcesConfig, PipelineConfig } from './types';
import { fetchFromWebsites } from './fetchWebsites';
import { fetchJson, withRetry } from './retry';

interface NewsApiArticle {
  title?: string | null;
  description?: string | null;
  content?: string | null;
  url?: string | null;
  urlToImage?: string | null;
  publishedAt?: string | null;
  source?: { name?: string | null };
}

interface NewsApiResponse {
  status?: string;
  code?: string;
  message?: string;
  articles?: NewsApiArticle[];
}

const DEFAULT_QUERY = 'artificial intelligence OR "human-centered AI" OR ethics';

export function normalizeWebsite(raw: string): string | null {
  let value = raw.trim().toLowerCase();
  if (!value) return null;
  value = value.replace(/^https?:\/\//, '').replace(/^www\./, '');
  value = value.split('/')[0].split('?')[0].split(':')[0];
  if (!value.includes('.')) return null;
  return value;
}

export function websitesFromConfig(config: PipelineConfig): string[] {
  const raw = config.newsWebsites;
  const list = Array.isArray(raw)
    ? raw
    : typeof raw === 'string'
      ? String(raw).split(/[\n,]+/)
      : [];
  return [...new Set(list.map((item) => normalizeWebsite(String(item))).filter((item): item is string => Boolean(item)))];
}

function normalizeSources(raw: PipelineConfig['newsSources']): NewsSourcesConfig {
  if (!raw) return { language: 'en', pageSize: 20 };
  if (Array.isArray(raw)) {
    return {
      endpoint: 'everything',
      sources: raw.join(','),
      language: 'en',
      pageSize: 20,
    };
  }
  return raw;
}

function mapArticles(articles: NewsApiArticle[] = []): NewsArticle[] {
  return articles
    .filter((a) => a.title && a.url)
    .map((a) => ({
      title: a.title!.trim(),
      description: (a.description || '').trim(),
      content: (a.content || '').trim(),
      url: a.url!,
      sourceName: a.source?.name || 'Unknown',
      publishedAt: a.publishedAt || new Date().toISOString(),
      urlToImage: a.urlToImage || undefined,
    }));
}

export async function fetchNews(
  config: PipelineConfig,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>,
  onInfo?: (message: string) => void | Promise<void>
): Promise<NewsArticle[]> {
  const websites = websitesFromConfig(config);
  if (websites.length) {
    const { articles, notes } = await fetchFromWebsites(websites);
    for (const note of notes) {
      const via = note.via === 'none' ? 'no source' : note.via;
      await onInfo?.(`${note.domain}: ${note.count} article(s) via ${via}${note.detail ? ` (${note.detail})` : ''}`);
    }
    return articles;
  }

  const apiKey = process.env.NEWSAPI_KEY;
  if (!apiKey) {
    throw new Error('NEWSAPI_KEY is not set');
  }

  const sources = normalizeSources(config.newsSources);
  const endpoint = sources.endpoint === 'top-headlines' ? 'top-headlines' : 'everything';
  const params = new URLSearchParams();

  if (sources.q) params.set('q', sources.q);
  else if (endpoint === 'everything' && !sources.sources) params.set('q', DEFAULT_QUERY);

  const sourceList = Array.isArray(sources.sources) ? sources.sources.join(',') : sources.sources;
  if (sourceList) params.set('sources', sourceList);
  if (sources.language) params.set('language', sources.language);
  if (sources.country && endpoint === 'top-headlines') params.set('country', sources.country);
  if (sources.category && endpoint === 'top-headlines') params.set('category', sources.category);
  params.set('pageSize', String(Math.min(sources.pageSize ?? 20, 50)));
  if (endpoint === 'everything') params.set('sortBy', 'publishedAt');

  const url = `https://newsapi.org/v2/${endpoint}?${params.toString()}`;
  const data = await withRetry(
    () =>
      fetchJson<NewsApiResponse>(url, {
        headers: { 'X-Api-Key': apiKey },
      }),
    { retries: 3, minDelayMs: 800, onRetry }
  );

  if (data.status === 'error' || data.code) {
    throw new Error(data.message || `NewsAPI error: ${data.code || 'unknown'}`);
  }

  return mapArticles(data.articles);
}
