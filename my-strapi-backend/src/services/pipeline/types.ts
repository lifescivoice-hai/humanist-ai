export type PublishMode = 'draft' | 'publish';

export type RunStatus = 'running' | 'success' | 'partial' | 'failed';

export type LogLevel = 'info' | 'warn' | 'error';

export interface PipelineLog {
  step: string;
  level: LogLevel;
  message: string;
  timestamp: string;
}

export interface NewsSourcesConfig {
  endpoint?: 'everything' | 'top-headlines';
  q?: string;
  sources?: string[] | string;
  domains?: string;
  language?: string;
  country?: string;
  category?: string;
  pageSize?: number;
}

export interface PipelineConfig {
  documentId?: string;
  enabled?: boolean;
  articlesPerDay?: number;
  runTime?: string;
  timezone?: string;
  publishMode?: PublishMode;
  newsSources?: NewsSourcesConfig | string[] | null;
  /** Hostnames like techcrunch.com. Empty = NewsAPI default query. */
  newsWebsites?: string[] | null;
  categories?: string[] | null;
  rewritePrompt?: string | null;
  imageStylePrompt?: string | null;
}

export interface NewsArticle {
  title: string;
  description: string;
  content: string;
  url: string;
  sourceName: string;
  publishedAt: string;
  urlToImage?: string;
}

export interface Classification {
  relevant: boolean;
  category: string;
  reason: string;
}

export interface RewrittenArticle {
  title: string;
  excerpt: string;
  content: string;
}

export interface RunOptions {
  /** Skip the `enabled` flag — used for manual test runs. */
  force?: boolean;
}
