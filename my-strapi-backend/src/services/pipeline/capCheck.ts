import type { Core } from '@strapi/strapi';
import type { PipelineConfig } from './types';

/**
 * Start of "today" in an IANA timezone, as a UTC Date.
 * Uses the timezone name (not a fixed offset) so DST is handled by the platform.
 */
export function startOfDayInTimeZone(timeZone: string, now = new Date()): Date {
  const parts = new Intl.DateTimeFormat('en-CA', {
    timeZone,
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
  }).formatToParts(now);

  const year = parts.find((p) => p.type === 'year')?.value;
  const month = parts.find((p) => p.type === 'month')?.value;
  const day = parts.find((p) => p.type === 'day')?.value;
  const localMidnight = `${year}-${month}-${day}T00:00:00`;

  const asUtc = new Date(`${localMidnight}Z`);
  const shown = new Date(asUtc.toLocaleString('en-US', { timeZone }));
  const offsetMs = asUtc.getTime() - shown.getTime();
  return new Date(asUtc.getTime() + offsetMs);
}

export async function countArticlesCreatedToday(
  strapi: Core.Strapi,
  config: PipelineConfig,
  excludeDocumentId?: string
): Promise<number> {
  const tz = config.timezone || 'America/New_York';
  const since = startOfDayInTimeZone(tz);

  const runs = await strapi.documents('api::pipeline-run.pipeline-run').findMany({
    filters: {
      startedAt: { $gte: since.toISOString() },
      runStatus: { $in: ['success', 'partial', 'running'] },
    },
    fields: ['articlesCreated'],
    limit: 100,
  });

  return (runs || [])
    .filter((run) => !excludeDocumentId || run.documentId !== excludeDocumentId)
    .reduce((sum, run) => sum + (run.articlesCreated || 0), 0);
}

/** True when another article may still be created today. */
export function capCheck(createdSoFar: number, articlesPerDay: number): boolean {
  return createdSoFar < articlesPerDay;
}
