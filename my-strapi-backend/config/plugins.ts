import type { Core } from '@strapi/strapi';

/**
 * Cloudflare R2 via S3-compatible API.
 * Docs: https://docs.strapi.io/cms/configurations/media-library-providers/amazon-s3
 * R2: omit ACL (not supported). Set R2_* env vars on Render / locally.
 */
const config = ({ env }: Core.Config.Shared.ConfigParams): Core.Config.Plugin => ({
  upload: {
    config: {
      provider: 'aws-s3',
      providerOptions: {
        baseUrl: env('R2_PUBLIC_URL'),
        s3Options: {
          credentials: {
            accessKeyId: env('R2_ACCESS_KEY_ID'),
            secretAccessKey: env('R2_SECRET_ACCESS_KEY'),
          },
          region: env('R2_REGION', 'auto'),
          endpoint: env('R2_ENDPOINT'),
          params: {
            Bucket: env('R2_BUCKET'),
          },
        },
      },
    },
  },
});

export default config;
