import type { Core } from '@strapi/strapi';

import { UPLOAD_MAX_BYTES } from './plugins';

export default ({ env }: Core.Config.Shared.ConfigParams): Core.Config.Middlewares => {
  const corsEnv = env('CORS_ORIGIN');
  const corsOrigins = corsEnv
    ? corsEnv.split(',').map((o) => o.trim())
    : ['http://localhost:8080', 'http://localhost:1337', 'http://127.0.0.1:8080'];

  let r2Origin = '';
  try {
    const pub = env('R2_PUBLIC_URL', '');
    if (pub) r2Origin = new URL(pub).origin;
  } catch {
    /* ignore invalid URL */
  }

  return [
    'strapi::logger',
    'strapi::errors',
    {
      name: 'strapi::security',
      config: {
        contentSecurityPolicy: {
          useDefaults: true,
          directives: {
            'connect-src': ["'self'", 'https:'],
            'img-src': [
              "'self'",
              'data:',
              'blob:',
              'https://market-assets.strapi.io',
              ...(r2Origin ? [r2Origin] : []),
            ],
            'media-src': [
              "'self'",
              'data:',
              'blob:',
              'https://market-assets.strapi.io',
              ...(r2Origin ? [r2Origin] : []),
            ],
            upgradeInsecureRequests: null,
          },
        },
      },
    },
    {
      name: 'strapi::cors',
      config: {
        origin: corsOrigins,
        headers: '*',
      },
    },
    'strapi::poweredBy',
    'strapi::query',
    {
      name: 'strapi::body',
      config: {
        formidable: {
          maxFileSize: UPLOAD_MAX_BYTES,
        },
      },
    },
    'strapi::session',
    // Tab icon for /admin — served at /favicon.ico (file: public/favicon.ico).
    {
      name: 'strapi::favicon',
      config: {
        path: 'public/favicon.ico',
      },
    },
    'strapi::public',
  ];
};
