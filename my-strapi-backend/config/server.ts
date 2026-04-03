import type { Core } from '@strapi/strapi';

const config = ({ env }: Core.Config.Shared.ConfigParams): Core.Config.Server => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  app: {
    keys: env.array('APP_KEYS'),
  },
  ...(env('PUBLIC_URL') ? { url: env('PUBLIC_URL') } : {}),
  proxy: env.bool('SERVER_PROXY', false),
});

export default config;
