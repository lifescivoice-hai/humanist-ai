import type { NewsArticle, PipelineConfig, RewrittenArticle } from './types';
import { classifyAndRewrite } from './classify';

/** @deprecated Use classifyAndRewrite — kept for callers that only need the rewrite fields. */
export async function rewrite(
  article: NewsArticle,
  config: PipelineConfig,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>
): Promise<RewrittenArticle> {
  const result = await classifyAndRewrite(article, config, onRetry);
  if (result.parseFailed) {
    throw new Error('Gemini rewrite JSON could not be parsed');
  }
  if (!result.relevant || !result.rewritten) {
    throw new Error('Gemini rewrite skipped — story not relevant');
  }
  return result.rewritten;
}
