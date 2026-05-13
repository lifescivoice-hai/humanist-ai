import path from 'path';
import type { Core } from '@strapi/strapi';

/**
 * Upload: disk under `public/uploads/YYYY/MM/DD/` via custom provider
 * (`providers/upload-local-dated`). Strapi resolves a non-namespaced provider by absolute path:
 * failing `@strapi/provider-upload-*`, then `require(provider)`.
 */

/** Media Library max file size (bytes); used by `strapi::body` in middlewares.ts */
export const UPLOAD_MAX_BYTES = 500 * 1024;

const datedLocalDiskProviderPath = path.join(process.cwd(), 'providers', 'upload-local-dated');

const config = (_params: Core.Config.Shared.ConfigParams): Core.Config.Plugin => ({
  upload: {
    config: {
      sizeLimit: UPLOAD_MAX_BYTES,
      provider: datedLocalDiskProviderPath,
      providerOptions: {},
    },
  },
});

export default config;
