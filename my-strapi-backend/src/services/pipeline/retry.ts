const sleep = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms));

export class PipelineHttpError extends Error {
  status: number;
  body: string;

  constructor(message: string, status: number, body: string) {
    super(message);
    this.name = 'PipelineHttpError';
    this.status = status;
    this.body = body;
  }
}

const BROWSER_UA =
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36';

export async function fetchText(
  url: string,
  init: RequestInit = {},
  timeoutMs = 20000
): Promise<{ status: number; text: string; contentType: string }> {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const res = await fetch(url, {
      ...init,
      signal: controller.signal,
      headers: {
        'User-Agent': BROWSER_UA,
        Accept: 'application/rss+xml, application/atom+xml, application/xml, text/xml, text/html;q=0.8, */*;q=0.5',
        ...(init.headers || {}),
      },
      redirect: 'follow',
    });
    const text = await res.text();
    return {
      status: res.status,
      text,
      contentType: res.headers.get('content-type') || '',
    };
  } finally {
    clearTimeout(timer);
  }
}

export async function fetchJson<T>(
  url: string,
  init: RequestInit = {},
  timeoutMs = 30000
): Promise<T> {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const res = await fetch(url, { ...init, signal: controller.signal });
    const text = await res.text();
    if (!res.ok) {
      throw new PipelineHttpError(
        `HTTP ${res.status} ${res.statusText}${text ? `: ${text.slice(0, 240)}` : ''}`,
        res.status,
        text.slice(0, 500)
      );
    }
    if (!text) return {} as T;
    return JSON.parse(text) as T;
  } finally {
    clearTimeout(timer);
  }
}

export async function withRetry<T>(
  fn: () => Promise<T>,
  options: {
    retries?: number;
    minDelayMs?: number;
    onRetry?: (attempt: number, error: Error) => void | Promise<void>;
  } = {}
): Promise<T> {
  const retries = options.retries ?? 3;
  const minDelayMs = options.minDelayMs ?? 600;
  let lastError: Error = new Error('retry failed');

  for (let attempt = 1; attempt <= retries; attempt += 1) {
    try {
      return await fn();
    } catch (err) {
      lastError = err instanceof Error ? err : new Error(String(err));
      const status = lastError instanceof PipelineHttpError ? lastError.status : 0;
      // 4xx (including 429 quota) will not succeed on retry — fail immediately.
      if (status && status < 500) break;
      if (attempt >= retries) break;
      if (options.onRetry) await options.onRetry(attempt, lastError);
      const delay =
        status === 429 || status === 503
          ? Math.min(45000, 8000 * 2 ** (attempt - 1))
          : minDelayMs * 2 ** (attempt - 1);
      await sleep(delay);
    }
  }

  throw lastError;
}

export { sleep };

function errorBlob(err: unknown): string {
  const msg = err instanceof Error ? err.message : String(err);
  const body = err instanceof PipelineHttpError ? err.body : '';
  return `${msg} ${body}`;
}

/** True only for Google Gemini quota — not Cloudflare Workers AI 429s. */
export function isGeminiQuotaError(err: unknown): boolean {
  const blob = errorBlob(err);
  if (/cloudflare|workers ai|capacity temporarily exceeded/i.test(blob)) return false;
  return /ai\.google\.dev|generativelanguage|exceeded your current quota|RESOURCE_EXHAUSTED/i.test(blob);
}

export function isCloudflareImageCapacityError(err: unknown): boolean {
  const blob = errorBlob(err);
  return /capacity temporarily exceeded|code"?\s*:\s*3040/i.test(blob);
}
