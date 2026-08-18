import type { NewsArticle, PipelineConfig, RewrittenArticle } from './types';
import { geminiGenerateJson } from './classify';

const DEFAULT_REWRITE_PROMPT = `Rewrite this news story for The Humanist AI, a publication about keeping humans at the center of technology.
Voice: clear, thoughtful, non-hype. No clickbait. No invented facts — only what is in the source.
Return JSON: { "title": string, "excerpt": string, "content": string }.
- title: original, under 90 characters
- excerpt: 1-2 sentences
- content: 4-8 short paragraphs, markdown allowed (## headings). Do not mention that this is a rewrite.`;

export async function rewrite(
  article: NewsArticle,
  config: PipelineConfig,
  onRetry?: (attempt: number, error: Error) => void | Promise<void>
): Promise<RewrittenArticle> {
  const template = (config.rewritePrompt || '').trim() || DEFAULT_REWRITE_PROMPT;

  const result = await geminiGenerateJson<RewrittenArticle>(
    `${template}

SOURCE TITLE: ${article.title}
SOURCE NAME: ${article.sourceName}
SOURCE URL: ${article.url}
SOURCE DESCRIPTION: ${article.description}
SOURCE CONTENT: ${article.content}`,
    onRetry
  );

  if (!result.title || !result.content) {
    throw new Error('Gemini rewrite missing title or content');
  }

  return {
    title: result.title.trim(),
    excerpt: (result.excerpt || '').trim(),
    content: result.content.trim(),
  };
}
