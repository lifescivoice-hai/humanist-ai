/**
 * Builds a sitemap.xml string from Strapi articles + categories.
 * Used by the build script and the production Express server.
 */

const DEFAULT_SITE_URL = 'https://thehumanistai.com';
const DEFAULT_STRAPI_URL = 'https://api.thehumanistai.com';

function escapeXml(value) {
  return String(value)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}

function toDate(value) {
  if (!value) return null;
  const d = new Date(value);
  return Number.isNaN(d.getTime()) ? null : d.toISOString().slice(0, 10);
}

function urlEntry(loc, lastmod, changefreq, priority) {
  const parts = [`    <loc>${escapeXml(loc)}</loc>`];
  if (lastmod) parts.push(`    <lastmod>${lastmod}</lastmod>`);
  if (changefreq) parts.push(`    <changefreq>${changefreq}</changefreq>`);
  if (priority) parts.push(`    <priority>${priority}</priority>`);
  return `  <url>\n${parts.join('\n')}\n  </url>`;
}

async function fetchAllPages(baseUrl, path, pageSize = 100) {
  const items = [];
  let page = 1;
  let pageCount = 1;

  while (page <= pageCount) {
    const sep = path.includes('?') ? '&' : '?';
    const url = `${baseUrl}${path}${sep}pagination[page]=${page}&pagination[pageSize]=${pageSize}`;
    const res = await fetch(url);
    if (!res.ok) {
      throw new Error(`Failed to fetch ${url}: ${res.status} ${res.statusText}`);
    }
    const json = await res.json();
    items.push(...(json.data || []));
    pageCount = json.meta?.pagination?.pageCount || 1;
    page += 1;
  }

  return items;
}

export async function buildSitemapXml({
  siteUrl = process.env.SITE_URL || DEFAULT_SITE_URL,
  strapiUrl = process.env.STRAPI_URL || process.env.VITE_STRAPI_URL || DEFAULT_STRAPI_URL,
} = {}) {
  const origin = siteUrl.replace(/\/$/, '');
  const api = strapiUrl.replace(/\/$/, '');

  const staticPages = [
    { path: '/', changefreq: 'daily', priority: '1.0' },
    { path: '/articles', changefreq: 'daily', priority: '0.9' },
    { path: '/blogs', changefreq: 'daily', priority: '0.9' },
    { path: '/about', changefreq: 'monthly', priority: '0.6' },
  ];

  let articles = [];
  let categories = [];

  try {
    articles = await fetchAllPages(
      api,
      '/api/articles?fields[0]=slug&fields[1]=updatedAt&fields[2]=publishedAt&sort[0]=publishedAt:desc'
    );
  } catch (err) {
    console.warn('[sitemap] Could not fetch articles:', err.message);
  }

  try {
    categories = await fetchAllPages(
      api,
      '/api/categories?fields[0]=slug&fields[1]=updatedAt&sort[0]=name:asc'
    );
  } catch (err) {
    console.warn('[sitemap] Could not fetch categories:', err.message);
  }

  const entries = [
    ...staticPages.map((p) =>
      urlEntry(`${origin}${p.path}`, null, p.changefreq, p.priority)
    ),
    ...articles
      .map((a) => {
        const slug = a.slug || a.attributes?.slug;
        if (!slug) return null;
        const lastmod = toDate(a.updatedAt || a.publishedAt || a.attributes?.updatedAt || a.attributes?.publishedAt);
        return urlEntry(`${origin}/articles/${slug}`, lastmod, 'weekly', '0.8');
      })
      .filter(Boolean),
    ...categories
      .map((c) => {
        const slug = c.slug || c.attributes?.slug;
        if (!slug) return null;
        const lastmod = toDate(c.updatedAt || c.attributes?.updatedAt);
        return urlEntry(`${origin}/categories/${slug}`, lastmod, 'weekly', '0.7');
      })
      .filter(Boolean),
  ];

  return `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${entries.join('\n')}
</urlset>
`;
}
