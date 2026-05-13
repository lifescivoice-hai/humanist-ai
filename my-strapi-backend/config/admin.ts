import type { Core } from '@strapi/types';

const config = ({ env }: Core.Config.Shared.ConfigParams): Core.Config.Admin => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET'),
    // Replaces deprecated auth.options.expiresIn (Strapi 6 removes it). Seconds — same as legacy 30d defaults.
    sessions: {
      maxRefreshTokenLifespan: 30 * 24 * 60 * 60,
      maxSessionLifespan: 30 * 24 * 60 * 60,
    },
  },
  apiToken: {
    salt: env('API_TOKEN_SALT'),
  },
  transfer: {
    token: {
      salt: env('TRANSFER_TOKEN_SALT'),
    },
  },
  secrets: {
    encryptionKey: env('ENCRYPTION_KEY'),
  },
  flags: {
    nps: env.bool('FLAG_NPS', true),
    promoteEE: env.bool('FLAG_PROMOTE_EE', true),
  },
});

export default config;
