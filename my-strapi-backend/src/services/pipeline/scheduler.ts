import { Cron } from 'croner';
import type { Core } from '@strapi/strapi';
import { runPipeline } from './runPipeline';
import type { PipelineConfig } from './types';

let job: Cron | null = null;

const TIME_RE = /^([01]?\d|2[0-3]):([0-5]\d)$/;

function parseRunTime(runTime: string): { minute: number; hour: number } | null {
  const match = (runTime || '').trim().match(TIME_RE);
  if (!match) return null;
  return { hour: Number(match[1]), minute: Number(match[2]) };
}

export function stopScheduler() {
  job?.stop();
  job = null;
}

export function nextRunAt(): Date | null {
  return job?.nextRun() ?? null;
}

/**
 * Cancel any existing cron and reschedule from pipeline-config.
 * Croner uses the IANA timezone name (DST-safe). No UTC offset is stored.
 */
export async function applySchedule(strapi: Core.Strapi) {
  stopScheduler();

  const config = (await strapi
    .documents('api::pipeline-config.pipeline-config')
    .findFirst()) as PipelineConfig | null;

  if (!config?.enabled) {
    strapi.log.info('[pipeline] scheduler idle — enabled is false');
    return;
  }

  const parsed = parseRunTime(config.runTime || '07:00');
  if (!parsed) {
    strapi.log.error(`[pipeline] invalid runTime "${config.runTime}" (expected HH:mm)`);
    return;
  }

  const timezone = (config.timezone || 'America/New_York').trim();
  const pattern = `${parsed.minute} ${parsed.hour} * * *`;

  try {
    job = new Cron(
      pattern,
      {
        timezone,
        name: 'news-pipeline',
        protect: true,
        mode: '5-part',
      },
      () => {
        strapi.log.info('[pipeline] cron fired');
        runPipeline(strapi, { force: false }).catch((err) => {
          strapi.log.error(
            `[pipeline] scheduled run failed: ${err instanceof Error ? err.message : err}`
          );
        });
      }
    );
  } catch (err) {
    strapi.log.error(
      `[pipeline] failed to schedule (${pattern} ${timezone}): ${err instanceof Error ? err.message : err}`
    );
    job = null;
    return;
  }

  const next = job.nextRun();
  strapi.log.info(
    `[pipeline] scheduled daily at ${config.runTime} (${timezone}); next run ${next?.toISOString() ?? 'unknown'}`
  );
}
