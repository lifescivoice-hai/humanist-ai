import type { Core } from '@strapi/strapi';
import { capCheck, countArticlesCreatedToday } from './capCheck';
import { classifyAndRewrite } from './classify';
import { createArticle } from './createArticle';
import { fetchNews, websitesFromConfig } from './fetchNews';
import { generateCompressedImage } from './generateImage';
import { acquireLock, releaseLock } from './lock';
import { RunLogger } from './logger';
import { prefilterNews } from './prefilter';
import { isGeminiQuotaError, sleep } from './retry';
import type { PipelineConfig, RunOptions, RunStatus } from './types';

const DEFAULT_CONFIG: Partial<PipelineConfig> = {
  enabled: false,
  articlesPerDay: 3,
  runTime: '07:00',
  timezone: 'America/New_York',
  publishMode: 'draft',
};

async function loadConfig(strapi: Core.Strapi): Promise<PipelineConfig> {
  const existing = await strapi.documents('api::pipeline-config.pipeline-config').findFirst();
  if (existing) return existing as PipelineConfig;

  return (await strapi.documents('api::pipeline-config.pipeline-config').create({
    data: {
      enabled: false,
      articlesPerDay: 3,
      runTime: '07:00',
      timezone: 'America/New_York',
      publishMode: 'draft',
      newsSources: { q: 'artificial intelligence', language: 'en', pageSize: 20 },
      categories: ['AI', 'Technology', 'Ethics', 'Society'],
    },
  })) as PipelineConfig;
}

export async function runPipeline(strapi: Core.Strapi, options: RunOptions = {}) {
  const config = { ...DEFAULT_CONFIG, ...(await loadConfig(strapi)) };
  const articlesPerDay = Math.max(1, config.articlesPerDay || 3);

  if (!config.enabled && !options.force) {
    strapi.log.info('[pipeline] skipped — pipeline-config.enabled is false');
    return { skipped: true, reason: 'disabled' as const };
  }

  const lockToken = await acquireLock(strapi);
  if (!lockToken) {
    strapi.log.warn('[pipeline] skipped — another instance holds the run lock');
    return { skipped: true, reason: 'locked' as const };
  }

  try {
    return await executePipeline(strapi, config, articlesPerDay, options);
  } finally {
    await releaseLock(strapi, lockToken);
  }
}

async function executePipeline(
  strapi: Core.Strapi,
  config: PipelineConfig,
  articlesPerDay: number,
  options: RunOptions
) {

  const run = await strapi.documents('api::pipeline-run.pipeline-run').create({
    data: {
      runStatus: 'running',
      startedAt: new Date().toISOString(),
      articlesCreated: 0,
      logs: [],
    },
  });

  const logger = new RunLogger(strapi, run.documentId);
  let created = 0;
  let stepErrors = 0;
  let failureReason: string | null = null;

  const finish = async (runStatus: RunStatus, error?: string) => {
    await logger.flush({
      articlesCreated: created,
      runStatus,
      finishedAt: new Date().toISOString(),
      error: error || null,
      failureReason,
    });
    return { skipped: false as const, runStatus, articlesCreated: created, documentId: run.documentId };
  };

  try {
    await logger.log('start', 'info', `Run started (force=${Boolean(options.force)}, cap=${articlesPerDay}, mode=${config.publishMode})`);

    const priorToday = await countArticlesCreatedToday(strapi, config, run.documentId);
    await logger.log('capCheck', 'info', `${priorToday} article(s) already created today before this run`);

    if (!capCheck(priorToday, articlesPerDay)) {
      await logger.log('capCheck', 'info', 'Daily cap already reached');
      return finish('success');
    }

    const retryLog =
      (step: string) => async (attempt: number, error: Error) => {
        await logger.log(step, 'warn', `Retry ${attempt}: ${error.message}`);
      };

    const news = await fetchNews(config, retryLog('fetchNews'), (message) =>
      logger.log('fetchNews', 'info', message)
    );
    const websites = websitesFromConfig(config);
    await logger.log(
      'fetchNews',
      news.length ? 'info' : 'warn',
      websites.length
        ? `Fetched ${news.length} article(s) from listed websites (RSS / Google News)`
        : `Fetched ${news.length} article(s)`
    );
    const { kept, dropped } = prefilterNews(news, config);
    await logger.log(
      'prefilter',
      'info',
      `Local filter kept ${kept.length}/${news.length} (dropped ${dropped.length} before Gemini)`
    );
    for (const skip of dropped.slice(0, 12)) {
      await logger.log('prefilter', 'info', `Dropped "${skip.title}" (${skip.reason})`);
    }

    const remaining = Math.max(1, articlesPerDay - priorToday);
    const candidateLimit = remaining + 2;
    const candidates = kept.slice(0, candidateLimit);
    await logger.log(
      'prefilter',
      'info',
      `Sending ${candidates.length} story(ies) to Gemini classify+rewrite (1 call each, cap ${articlesPerDay})`
    );

    let geminiCalls = 0;

    for (const item of candidates) {
      if (!capCheck(priorToday + created, articlesPerDay)) {
        await logger.log('capCheck', 'info', `Reached daily cap of ${articlesPerDay}`);
        break;
      }

      try {
        if (geminiCalls > 0 && String(process.env.GEMINI_MOCK_MODE || '').toLowerCase() !== 'true') {
          await sleep(2000);
        }
        geminiCalls += 1;

        const gemini = await classifyAndRewrite(item, config, retryLog('gemini'));
        if (gemini.parseFailed) {
          stepErrors += 1;
          await logger.log(
            'gemini',
            'error',
            `Skipped "${item.title}": Gemini JSON parse failed. Raw: ${(gemini.raw || '').slice(0, 500)}`
          );
          continue;
        }

        await logger.log(
          'gemini',
          'info',
          `"${item.title}" → relevant=${gemini.relevant} category=${gemini.category}`
        );
        if (!gemini.relevant || !gemini.rewritten) {
          await logger.log('gemini', 'info', `Skipped "${item.title}" (not relevant)`);
          continue;
        }

        const rewritten = gemini.rewritten;
        const categoryName = gemini.category;
        await logger.log('gemini', 'info', `Rewrote as "${rewritten.title}"`);

        const image = await generateCompressedImage(
          rewritten,
          config,
          retryLog('generateImage'),
          async (attempt, error) => {
            await logger.log(
              'generateImage',
              'warn',
              `Image attempt ${attempt} failed (${error.message}); generating a new image`
            );
          }
        );
        await logger.log('generateImage', 'info', `Image ready (${image.length} bytes)`);

        const saved = await createArticle(strapi, rewritten, {
          config,
          categoryName,
          image,
        });
        created += 1;
        await logger.flush({ articlesCreated: created });
        await logger.log(
          'createArticle',
          'info',
          `Created ${config.publishMode} article ${saved?.documentId || saved?.id} ("${rewritten.title}")`
        );
      } catch (articleErr) {
        stepErrors += 1;
        const msg = articleErr instanceof Error ? articleErr.message : String(articleErr);
        await logger.log('article', 'error', `Skipped "${item.title}": ${msg}`);
        if (isGeminiQuotaError(articleErr)) {
          failureReason = 'gemini_quota_exhausted';
          await logger.log(
            'run',
            'warn',
            `Gemini quota hit at ${new Date().toISOString()} — stopping so we do not burn remaining calls`
          );
          break;
        }
      }
    }

    let runStatus: RunStatus = 'success';
    if (created === 0 && stepErrors > 0) runStatus = 'failed';
    else if (stepErrors > 0) runStatus = 'partial';

    await logger.log('done', 'info', `Finished with ${created} article(s), status=${runStatus}${failureReason ? `, reason=${failureReason}` : ''}`);
    return finish(runStatus);
  } catch (err) {
    const message = err instanceof Error ? err.message : String(err);
    await logger.log('run', 'error', message);
    return finish(created > 0 ? 'partial' : 'failed', message);
  }
}
