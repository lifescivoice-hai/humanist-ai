import type { Core } from '@strapi/strapi';
import { applySchedule, nextRunAt, runPipeline } from '../../../services/pipeline';
import type { PipelineConfig, PublishMode } from '../../../services/pipeline/types';

type Ctx = {
  query: Record<string, string | undefined>;
  params: Record<string, string | undefined>;
  request: { body?: Record<string, unknown> };
  unauthorized: (msg?: string) => unknown;
  badRequest: (msg?: string) => unknown;
  notFound: (msg?: string) => unknown;
  body: unknown;
};

const CONFIG_KEYS = [
  'enabled',
  'articlesPerDay',
  'runTime',
  'timezone',
  'publishMode',
  'newsSources',
  'newsWebsites',
  'categories',
  'rewritePrompt',
  'imageStylePrompt',
] as const;

const TIME_RE = /^([01]?\d|2[0-3]):([0-5]\d)$/;

const pickConfig = (row: PipelineConfig | null) => {
  if (!row) return null;
  const out: Record<string, unknown> = { documentId: row.documentId };
  for (const key of CONFIG_KEYS) {
    out[key] = row[key];
  }
  return out;
};

const isValidTimeZone = (tz: string) => {
  try {
    Intl.DateTimeFormat('en-US', { timeZone: tz }).format(new Date());
    return true;
  } catch {
    return false;
  }
};

async function loadOrCreateConfig(strapi: Core.Strapi): Promise<PipelineConfig> {
  const existing = await strapi.documents('api::pipeline-config.pipeline-config').findFirst();
  if (existing) return existing as PipelineConfig;
  return (await strapi.documents('api::pipeline-config.pipeline-config').create({
    data: {
      enabled: false,
      articlesPerDay: 3,
      runTime: '07:00',
      timezone: 'America/New_York',
      publishMode: 'draft',
    },
  })) as PipelineConfig;
}

function parseBody(body: Record<string, unknown> | undefined) {
  const data: Record<string, unknown> = {};
  if (!body || typeof body !== 'object') return data;

  if (typeof body.enabled === 'boolean') data.enabled = body.enabled;
  if (body.articlesPerDay !== undefined) {
    const n = Number(body.articlesPerDay);
    if (!Number.isInteger(n) || n < 1) {
      throw new Error('articlesPerDay must be an integer >= 1');
    }
    data.articlesPerDay = n;
  }
  if (typeof body.runTime === 'string') {
    if (!TIME_RE.test(body.runTime.trim())) {
      throw new Error('runTime must be HH:mm');
    }
    data.runTime = body.runTime.trim();
  }
  if (typeof body.timezone === 'string') {
    const tz = body.timezone.trim();
    if (!isValidTimeZone(tz)) {
      throw new Error('timezone must be a valid IANA name');
    }
    data.timezone = tz;
  }
  if (typeof body.publishMode === 'string') {
    if (body.publishMode !== 'draft' && body.publishMode !== 'publish') {
      throw new Error('publishMode must be draft or publish');
    }
    data.publishMode = body.publishMode as PublishMode;
  }
  if (body.newsSources !== undefined) data.newsSources = body.newsSources;
  if (body.newsWebsites !== undefined) {
    const raw = body.newsWebsites;
    const list = Array.isArray(raw)
      ? raw
      : typeof raw === 'string'
        ? raw.split(/[\n,]+/)
        : [];
    data.newsWebsites = list.map((item) => String(item).trim()).filter(Boolean);
  }
  if (body.categories !== undefined) data.categories = body.categories;
  if (typeof body.rewritePrompt === 'string' || body.rewritePrompt === null) {
    data.rewritePrompt = body.rewritePrompt;
  }
  if (typeof body.imageStylePrompt === 'string' || body.imageStylePrompt === null) {
    data.imageStylePrompt = body.imageStylePrompt;
  }
  return data;
}

export default ({ strapi }: { strapi: Core.Strapi }) => ({
  async getConfig(ctx: Ctx) {
    const config = await loadOrCreateConfig(strapi);
    const lastRuns = await strapi.documents('api::pipeline-run.pipeline-run').findMany({
      sort: { startedAt: 'desc' },
      limit: 1,
    });
    const last = lastRuns?.[0];
    ctx.body = {
      data: {
        ...pickConfig(config),
        nextRunAt: nextRunAt()?.toISOString() ?? null,
        lastRun: last
          ? {
              documentId: last.documentId,
              runStatus: last.runStatus,
              startedAt: last.startedAt,
              finishedAt: last.finishedAt,
              articlesCreated: last.articlesCreated,
            }
          : null,
      },
    };
  },

  async updateConfig(ctx: Ctx) {
    let data: Record<string, unknown>;
    try {
      data = parseBody(ctx.request.body);
    } catch (err) {
      return ctx.badRequest(err instanceof Error ? err.message : 'Invalid body');
    }
    if (!Object.keys(data).length) {
      return ctx.badRequest('No valid fields to update');
    }

    const existing = await loadOrCreateConfig(strapi);
    const updated = (await strapi.documents('api::pipeline-config.pipeline-config').update({
      documentId: existing.documentId,
      data,
    })) as PipelineConfig;

    await applySchedule(strapi);

    ctx.body = {
      data: {
        ...pickConfig(updated),
        nextRunAt: nextRunAt()?.toISOString() ?? null,
      },
    };
  },

  async getRuns(ctx: Ctx) {
    const page = Math.max(1, Number(ctx.query.page) || 1);
    const pageSize = Math.min(100, Math.max(1, Number(ctx.query.pageSize) || 20));
    const start = (page - 1) * pageSize;

    const [rows, total] = await Promise.all([
      strapi.documents('api::pipeline-run.pipeline-run').findMany({
        sort: { startedAt: 'desc' },
        start,
        limit: pageSize,
      }),
      strapi.db.query('api::pipeline-run.pipeline-run').count(),
    ]);

    ctx.body = {
      data: rows,
      meta: {
        pagination: {
          page,
          pageSize,
          pageCount: Math.ceil(Number(total) / pageSize) || 1,
          total: Number(total),
        },
      },
    };
  },

  async runNow(ctx: Ctx) {
    const result = await runPipeline(strapi, { force: true });
    ctx.body = { data: result };
  },

  async getQueue(ctx: Ctx) {
    const config = await loadOrCreateConfig(strapi);
    const articles = await strapi.documents('api::article.article').findMany({
      status: 'draft',
      filters: { publishedAt: { $null: true } },
      sort: { createdAt: 'desc' },
      limit: 50,
      populate: { featuredImage: true, categories: true },
    });

    ctx.body = {
      data: {
        publishMode: config.publishMode || 'draft',
        articles: (articles || []).map((article) => ({
          documentId: article.documentId,
          title: article.title,
          slug: article.slug,
          excerpt: article.excerpt,
          author: article.author,
          createdAt: article.createdAt,
          featuredImage: article.featuredImage,
          categories: article.categories,
        })),
      },
    };
  },

  async approveArticle(ctx: Ctx) {
    const id = ctx.params.id;
    if (!id) return ctx.badRequest('Missing article id');

    const article = await strapi.documents('api::article.article').findOne({
      documentId: id,
      status: 'draft',
    });
    if (!article) return ctx.notFound('Article not found');

    const published = await strapi.documents('api::article.article').publish({
      documentId: id,
    });
    ctx.body = { data: published };
  },

  async rejectArticle(ctx: Ctx) {
    const id = ctx.params.id;
    if (!id) return ctx.badRequest('Missing article id');

    const article = await strapi.documents('api::article.article').findOne({
      documentId: id,
      status: 'draft',
    });
    if (!article) return ctx.notFound('Article not found');
    if (article.publishedAt) {
      return ctx.badRequest('Cannot reject a published article');
    }

    await strapi.documents('api::article.article').delete({ documentId: id });
    ctx.body = { data: { documentId: id, deleted: true } };
  },
});
