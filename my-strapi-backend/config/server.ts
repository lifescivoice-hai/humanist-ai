import type { Core } from '@strapi/types';

/** Render sets PORT; an empty PORT in the dashboard can override it and make env.int → NaN. */
function resolvePort(env: Core.Config.Shared.ConfigParams['env']): number {
  for (const raw of [env('PORT'), process.env.PORT]) {
    if (raw === undefined || raw === '') continue;
    const n = parseInt(String(raw), 10);
    if (Number.isFinite(n) && n >= 0 && n < 65536) return n;
  }
  return 1337;
}

const config = ({ env }: Core.Config.Shared.ConfigParams): Core.Config.Server => ({
  host: env('HOST', '0.0.0.0'),
  port: resolvePort(env),
  app: {
    keys: env.array('APP_KEYS'),
  },
  ...(env('PUBLIC_URL') ? { url: env('PUBLIC_URL') } : {}),
  proxy: env.bool('SERVER_PROXY', false),
});

export default config;
