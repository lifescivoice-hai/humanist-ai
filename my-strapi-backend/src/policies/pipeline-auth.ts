import crypto from 'crypto';
import type { Core } from '@strapi/strapi';
import { errors } from '@strapi/utils';

type PolicyContext = {
  request?: { header?: { authorization?: string }; headers?: { authorization?: string } };
  header?: { authorization?: string };
};

const getBearer = (ctx: PolicyContext) => {
  const header =
    ctx.request?.header?.authorization ||
    ctx.request?.headers?.authorization ||
    ctx.header?.authorization ||
    '';
  return String(header).replace(/^Bearer\s+/i, '').trim();
};

const safeEqual = (a: string, b: string) => {
  const ba = Buffer.from(a);
  const bb = Buffer.from(b);
  if (ba.length !== bb.length) return false;
  return crypto.timingSafeEqual(ba, bb);
};

const verifyHs256 = (token: string, secret: string) => {
  const parts = token.split('.');
  if (parts.length !== 3) return false;
  const [header, payload, signature] = parts;
  const expected = crypto
    .createHmac('sha256', secret)
    .update(`${header}.${payload}`)
    .digest('base64url');
  if (!safeEqual(signature, expected)) return false;
  try {
    const data = JSON.parse(Buffer.from(payload, 'base64url').toString('utf8'));
    if (typeof data.exp === 'number' && data.exp * 1000 < Date.now()) return false;
    return true;
  } catch {
    return false;
  }
};

const hashApiToken = (accessKey: string, salt: string) =>
  crypto.createHmac('sha512', salt).update(accessKey).digest('hex');

async function isStrapiApiToken(strapi: Core.Strapi, token: string) {
  try {
    const service = strapi.service('admin::api-token') as {
      hash?: (key: string) => string;
      getBy?: (params: { accessKey: string }) => Promise<{ expiresAt?: string | Date | null } | null>;
    } | undefined;

    let hashed: string | undefined;
    if (typeof service?.hash === 'function') {
      hashed = service.hash(token);
    } else {
      const salt = strapi.config.get('admin.apiToken.salt') as string | undefined;
      if (!salt) return false;
      hashed = hashApiToken(token, salt);
    }

    let row: { expiresAt?: string | Date | null } | null = null;
    if (typeof service?.getBy === 'function') {
      row = await service.getBy({ accessKey: hashed });
    } else {
      row = await strapi.db.query('admin::api-token').findOne({
        where: { accessKey: hashed },
      });
    }
    if (!row) return false;
    if (row.expiresAt && new Date(row.expiresAt).getTime() < Date.now()) return false;
    return true;
  } catch {
    return false;
  }
}

/**
 * Accepts PIPELINE_DASHBOARD_TOKEN, a Strapi API token, or a valid admin JWT.
 */
export default async (
  ctx: PolicyContext,
  _config: unknown,
  { strapi }: { strapi: Core.Strapi }
) => {
  const token = getBearer(ctx);
  if (!token) {
    throw new errors.UnauthorizedError('Missing bearer token');
  }

  const dashboardToken = process.env.PIPELINE_DASHBOARD_TOKEN;
  if (dashboardToken && safeEqual(token, dashboardToken)) {
    return true;
  }

  if (await isStrapiApiToken(strapi, token)) {
    return true;
  }

  const adminSecret = strapi.config.get('admin.auth.secret') as string | undefined;
  if (adminSecret && verifyHs256(token, adminSecret)) {
    return true;
  }

  throw new errors.UnauthorizedError('Invalid pipeline token');
};
