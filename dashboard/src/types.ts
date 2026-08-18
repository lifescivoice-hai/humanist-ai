export type PublishMode = 'draft' | 'publish';
export type RunStatus = 'running' | 'success' | 'partial' | 'failed';

export interface LastRun {
  documentId?: string;
  runStatus?: RunStatus;
  startedAt?: string;
  finishedAt?: string;
  articlesCreated?: number;
}

export interface PipelineConfig {
  documentId?: string;
  enabled?: boolean;
  articlesPerDay?: number;
  runTime?: string;
  timezone?: string;
  publishMode?: PublishMode;
  newsSources?: unknown;
  newsWebsites?: string[] | null;
  categories?: unknown;
  rewritePrompt?: string | null;
  imageStylePrompt?: string | null;
  nextRunAt?: string | null;
  lastRun?: LastRun | null;
}

export interface PipelineLog {
  step: string;
  level: 'info' | 'warn' | 'error';
  message: string;
  timestamp: string;
}

export interface PipelineRun {
  documentId: string;
  runStatus: RunStatus;
  startedAt: string;
  finishedAt?: string | null;
  articlesCreated?: number;
  logs?: PipelineLog[] | null;
  error?: string | null;
}

export interface QueueArticle {
  documentId: string;
  title?: string;
  slug?: string;
  excerpt?: string;
  author?: string;
  createdAt?: string;
  featuredImage?: { url?: string } | null;
  categories?: Array<{ name?: string }>;
}

export interface QueuePayload {
  publishMode: PublishMode;
  articles: QueueArticle[];
}

export interface RunsPage {
  data: PipelineRun[];
  meta: {
    pagination: {
      page: number;
      pageSize: number;
      pageCount: number;
      total: number;
    };
  };
}
