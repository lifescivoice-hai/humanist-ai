import { randomUUID } from 'crypto';
import type { Core } from '@strapi/strapi';

const UID = 'api::pipeline-lock.pipeline-lock' as const;
const LOCK_TTL_MS = 45 * 60 * 1000;

function tableAndColumns(strapi: Core.Strapi) {
  const meta = strapi.db.metadata.get(UID) as {
    tableName?: string;
    attributes?: Record<string, { columnName?: string }>;
  };
  const table = meta?.tableName || 'pipeline_locks';
  const col = (attr: string, fallback: string) =>
    meta?.attributes?.[attr]?.columnName || fallback;
  return {
    table,
    holderToken: col('holderToken', 'holder_token'),
    lockedAt: col('lockedAt', 'locked_at'),
    expiresAt: col('expiresAt', 'expires_at'),
    updatedAt: col('updatedAt', 'updated_at'),
  };
}

async function ensureLockRow(strapi: Core.Strapi) {
  const existing = await strapi.documents(UID).findFirst();
  if (existing) return;
  await strapi.documents(UID).create({
    data: {
      holderToken: null,
      lockedAt: null,
      expiresAt: null,
    },
  });
}

/**
 * Atomically claim the single lock row. Expired locks (crashed worker) can be stolen.
 * Returns a token to pass to releaseLock, or null if another instance holds it.
 */
export async function acquireLock(strapi: Core.Strapi): Promise<string | null> {
  await ensureLockRow(strapi);

  const token = randomUUID();
  const now = new Date();
  const expires = new Date(now.getTime() + LOCK_TTL_MS);
  const cols = tableAndColumns(strapi);
  const knex = strapi.db.connection;

  const updated = await knex(cols.table)
    .whereRaw(`(?? IS NULL OR ?? < ?)`, [cols.expiresAt, cols.expiresAt, now])
    .update({
      [cols.holderToken]: token,
      [cols.lockedAt]: now,
      [cols.expiresAt]: expires,
      [cols.updatedAt]: now,
    });

  return Number(updated) > 0 ? token : null;
}

export async function releaseLock(strapi: Core.Strapi, token: string) {
  const cols = tableAndColumns(strapi);
  const knex = strapi.db.connection;
  await knex(cols.table)
    .where({ [cols.holderToken]: token })
    .update({
      [cols.holderToken]: null,
      [cols.lockedAt]: null,
      [cols.expiresAt]: null,
      [cols.updatedAt]: new Date(),
    });
}
