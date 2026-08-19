import type { PipelineConfig, RewrittenArticle } from './types';
import { compressImage } from './compressImage';
import { fetchJson, sleep, withRetry } from './retry';

interface FluxResponse {
  result?: { image?: string };
  success?: boolean;
  errors?: Array<{ message?: string }>;
}

const DEFAULT_STYLE =
  'Editorial photograph, realistic lighting, no text, no watermarks, no logos, cinematic, human-centered technology.';

const IMAGE_ATTEMPTS = 3;

/** Cheapest generally-available Workers AI text-to-image model. */
export const DEFAULT_IMAGE_MODEL = '@cf/black-forest-labs/flux-1-schnell';

export async function generateImage(
  article: RewrittenArticle,
  config: PipelineConfig,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>,
  attempt = 1
): Promise<Buffer> {
  const accountId = process.env.CLOUDFLARE_ACCOUNT_ID;
  const token = process.env.CLOUDFLARE_API_TOKEN;
  if (!accountId || !token) {
    throw new Error('CLOUDFLARE_ACCOUNT_ID or CLOUDFLARE_API_TOKEN is not set');
  }

  const model = process.env.CLOUDFLARE_AI_MODEL || DEFAULT_IMAGE_MODEL;
  const style = (config.imageStylePrompt || '').trim() || DEFAULT_STYLE;
  const variation =
    attempt > 1 ? `\nVariation ${attempt}: different composition, alternate camera angle.` : '';
  const prompt = `${style}\nScene inspired by: ${article.title}. ${article.excerpt}${variation}`.slice(
    0,
    1800
  );

  const url = `https://api.cloudflare.com/client/v4/accounts/${accountId}/ai/run/${model}`;

  const data = await withRetry(
    () =>
      fetchJson<FluxResponse>(
        url,
        {
          method: 'POST',
          headers: {
            Authorization: `Bearer ${token}`,
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ prompt, steps: 4 }),
        },
        90000
      ),
    { retries: 3, minDelayMs: 1500, onRetry }
  );

  const b64 = data.result?.image;
  if (!b64) {
    const msg = data.errors?.map((e) => e.message).filter(Boolean).join('; ') || 'no image in response';
    throw new Error(`Cloudflare Workers AI: ${msg}`);
  }

  return Buffer.from(b64, 'base64');
}

/** Generate a new image and compress it. Retry with a new prompt if compression cannot stay under 450KB. */
export async function generateCompressedImage(
  article: RewrittenArticle,
  config: PipelineConfig,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>,
  onNewImage?: (attempt: number, error: Error) => void | Promise<void>
): Promise<Buffer> {
  let lastError: Error = new Error('Image generation failed');

  for (let attempt = 1; attempt <= IMAGE_ATTEMPTS; attempt += 1) {
    try {
      const raw = await generateImage(article, config, onRetry, attempt);
      return await compressImage(raw);
    } catch (err) {
      lastError = err instanceof Error ? err : new Error(String(err));
      if (attempt >= IMAGE_ATTEMPTS) break;
      if (onNewImage) await onNewImage(attempt, lastError);
      await sleep(800);
    }
  }

  throw lastError;
}
