import type { NewsArticle, NewsSourcesConfig, PipelineConfig } from './types';
import { websitesFromConfig } from './fetchNews';

const ALLOW = [
  'ai',
  'artificial intelligence',
  'machine learning',
  'deep learning',
  'llm',
  'gpt',
  'openai',
  'gemini',
  'claude',
  'anthropic',
  'neural',
  'algorithm',
  'robot',
  'automation',
  'cyber',
  'hacker',
  'malware',
  'data privacy',
  'surveillance',
  'semiconductor',
  'gpu',
  'chipmaker',
  'nvidia',
  'openai',
  'software',
  'tech',
  'technology',
  'digital',
  'ethics',
  'compute',
  'cloud',
  'model',
  'chatbot',
  'generative',
];

const DENY = [
  'chivas',
  'nba',
  'nfl',
  'mlb',
  'premier league',
  'la liga',
  'soccer',
  'football score',
  'back-to-school food',
  'recipe',
  'grocery',
  'real estate',
  'home sales',
  'median price',
  'celebrity',
  'horoscope',
  'lottery',
  'coupon',
];

const escapeRe = (value: string) => value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');

const haystack = (article: NewsArticle) =>
  `${article.title} ${article.description} ${article.content}`.toLowerCase();

const termsFromConfig = (config: PipelineConfig): string[] => {
  const extra: string[] = [];
  if (Array.isArray(config.categories)) {
    extra.push(...config.categories.map((c) => String(c).toLowerCase().trim()).filter(Boolean));
  }
  const sources = config.newsSources;
  if (sources && !Array.isArray(sources)) {
    const q = (sources as NewsSourcesConfig).q;
    if (q) {
      extra.push(
        ...q
          .split(/\s+OR\s+|[,"]/i)
          .map((part) => part.replace(/['"]/g, '').trim().toLowerCase())
          .filter((part) => part.length > 2)
      );
    }
  }
  return extra;
};

export function prefilterArticle(
  article: NewsArticle,
  config: PipelineConfig
): { keep: boolean; reason: string } {
  const text = haystack(article);
  const denyHit = DENY.find((term) => {
    if (term.length <= 4) {
      return new RegExp(`(?:^|[^a-z])${escapeRe(term)}(?:[^a-z]|$)`, 'i').test(text);
    }
    return text.includes(term);
  });
  if (denyHit) {
    return { keep: false, reason: `deny:${denyHit}` };
  }

  const listedSites = websitesFromConfig(config).length > 0;
  if (listedSites) {
    return { keep: true, reason: 'allowlist-site' };
  }

  const allow = [...new Set([...ALLOW, ...termsFromConfig(config)])];
  const allowHit = allow.find((term) => {
    if (term.length <= 3) {
      return new RegExp(`(?:^|[^a-z])${escapeRe(term)}(?:[^a-z]|$)`, 'i').test(text);
    }
    return text.includes(term);
  });

  if (!allowHit) {
    return { keep: false, reason: 'no-tech-keyword' };
  }

  return { keep: true, reason: `allow:${allowHit}` };
}

export function prefilterNews(articles: NewsArticle[], config: PipelineConfig) {
  const kept: NewsArticle[] = [];
  const dropped: Array<{ title: string; reason: string }> = [];

  for (const article of articles) {
    const result = prefilterArticle(article, config);
    if (result.keep) kept.push(article);
    else dropped.push({ title: article.title, reason: result.reason });
  }

  return { kept, dropped };
}
