import fs from 'fs';
import os from 'os';
import path from 'path';
import type { Core } from '@strapi/strapi';
import { estimateReadTime, textToBlocks } from './blocks';
import { compressImage } from './compressImage';
import type { PipelineConfig, RewrittenArticle } from './types';

const slugify = (value: string): string =>
  value
    .toLowerCase()
    .trim()
    .replace(/['"]/g, '')
    .replace(/[^a-z0-9._~\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .slice(0, 80);

async function uploadJpeg(strapi: Core.Strapi, jpeg: Buffer, filename: string) {
  const tmp = path.join(os.tmpdir(), filename);
  fs.writeFileSync(tmp, jpeg);
  try {
    const uploaded = await strapi.plugin('upload').service('upload').upload({
      data: {
        fileInfo: {
          name: filename,
          alternativeText: filename.replace(/\.jpg$/i, '').replace(/-/g, ' '),
        },
      },
      files: {
        filepath: tmp,
        originalFilename: filename,
        mimetype: 'image/jpeg',
        size: jpeg.length,
      },
    });
    const file = Array.isArray(uploaded) ? uploaded[0] : uploaded;
    if (!file) throw new Error('Upload returned no file');
    return file;
  } finally {
    fs.unlink(tmp, () => undefined);
  }
}

async function findCategoryDocumentId(strapi: Core.Strapi, name: string): Promise<string | null> {
  if (!name) return null;
  const matches = await strapi.documents('api::category.category').findMany({
    filters: {
      $or: [{ name: { $eqi: name } }, { slug: { $eqi: slugify(name) } }],
    },
    limit: 1,
  });
  return matches?.[0]?.documentId || null;
}

export async function createArticle(
  strapi: Core.Strapi,
  article: RewrittenArticle,
  options: {
    config: PipelineConfig;
    categoryName?: string;
    image: Buffer;
  }
) {
  const publishMode = options.config.publishMode === 'publish' ? 'publish' : 'draft';
  const slug = slugify(article.title) || `article-${Date.now()}`;
  const author = process.env.PIPELINE_ARTICLE_AUTHOR || 'Editorial Team';
  const published = new Date().toISOString().slice(0, 10);

  if (!options.image.length) {
    throw new Error('Article image is required');
  }
  const jpeg = await compressImage(options.image);
  const file = await uploadJpeg(strapi, jpeg, `${slug}.jpg`);
  const featuredImageId = file.id;

  const categoryId = options.categoryName
    ? await findCategoryDocumentId(strapi, options.categoryName)
    : null;

  const created = await strapi.documents('api::article.article').create({
    data: {
      title: article.title,
      slug,
      excerpt: article.excerpt,
      content: textToBlocks(article.content),
      author,
      published,
      readTime: estimateReadTime(`${article.title} ${article.excerpt} ${article.content}`),
      featuredImage: featuredImageId,
      ...(categoryId ? { categories: { connect: [{ documentId: categoryId }] } } : {}),
    },
    status: 'draft',
  });

  if (publishMode === 'publish' && created?.documentId) {
    await strapi.documents('api::article.article').publish({
      documentId: created.documentId,
    });
  }

  return created;
}
