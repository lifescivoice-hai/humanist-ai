import type { NewsArticle } from './types';
import { fetchText } from './retry';

const PER_SITE_LIMIT = 8;

const decodeXml = (raw: string) =>
  raw
    .replace(/<!\[CDATA\[([\s\S]*?)\]\]>/g, '$1')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&apos;/g, "'")
    .replace(/&#(\d+);/g, (_, n) => String.fromCharCode(Number(n)))
    .replace(/&#x([0-9a-fA-F]+);/g, (_, n) => String.fromCharCode(parseInt(n, 16)))
    .replace(/&amp;/g, '&')
    .trim();

const stripHtml = (raw: string) =>
  decodeXml(raw)
    .replace(/<[^>]+>/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();

const tagInner = (block: string, name: string) => {
  const match = block.match(new RegExp(`<${name}(?:\\s[^>]*)?>([\\s\\S]*?)</${name}>`, 'i'));
  return match ? decodeXml(match[1]) : '';
};

const attr = (block: string, name: string, key: string) => {
  const match = block.match(new RegExp(`<${name}[^>]*\\s${key}=["']([^"']+)["'][^>]*/?>`, 'i'));
  return match ? decodeXml(match[1]) : '';
};

function firstHttpUrl(value: string) {
  const match = value.match(/https?:\/\/[^\s"'<>]+/i);
  return match ? match[0].replace(/&amp;/g, '&') : '';
}

function itemLink(block: string) {
  const fromTag = tagInner(block, 'link');
  if (/^https?:\/\//i.test(fromTag)) return fromTag.split(/\s/)[0];
  const href = attr(block, 'link', 'href');
  if (/^https?:\/\//i.test(href)) return href;
  const guid = tagInner(block, 'guid');
  if (/^https?:\/\//i.test(guid)) return guid;
  return firstHttpUrl(block);
}

function itemImage(block: string) {
  return (
    attr(block, 'media:content', 'url') ||
    attr(block, 'media:thumbnail', 'url') ||
    attr(block, 'enclosure', 'url') ||
    undefined
  );
}

function isFeedXml(text: string) {
  const head = text.slice(0, 4000).toLowerCase();
  if (head.includes('sgcaptcha') || head.includes('<html')) return false;
  return /<(rss|feed|rdf:rdf)\b/.test(head) && /<(item|entry)\b/.test(text.toLowerCase());
}

export function parseFeed(xml: string, fallbackSource: string): NewsArticle[] {
  const chunks = [...xml.matchAll(/<(item|entry)\b[\s\S]*?<\/\1>/gi)].map((m) => m[0]);
  const articles: NewsArticle[] = [];

  for (const chunk of chunks) {
    const title = stripHtml(tagInner(chunk, 'title'));
    const url = itemLink(chunk);
    if (!title || !url) continue;
    const description = stripHtml(
      tagInner(chunk, 'description') ||
        tagInner(chunk, 'summary') ||
        tagInner(chunk, 'content:encoded') ||
        tagInner(chunk, 'content')
    );
    const publishedAt =
      tagInner(chunk, 'pubDate') ||
      tagInner(chunk, 'published') ||
      tagInner(chunk, 'updated') ||
      tagInner(chunk, 'dc:date') ||
      new Date().toISOString();
    const sourceName =
      stripHtml(tagInner(chunk, 'source')) ||
      stripHtml(tagInner(chunk, 'dc:creator')) ||
      fallbackSource;
    const parsedDate = new Date(publishedAt);
    articles.push({
      title,
      description,
      content: description,
      url,
      sourceName,
      publishedAt: Number.isNaN(parsedDate.getTime()) ? new Date().toISOString() : parsedDate.toISOString(),
      urlToImage: itemImage(chunk),
    });
  }

  return articles;
}

function feedCandidates(domain: string) {
  const hosts = domain.startsWith('www.') ? [domain] : [domain, `www.${domain}`];
  const paths = ['/feed', '/rss.xml'];
  const urls: string[] = [];
  for (const host of hosts) {
    for (const path of paths) urls.push(`https://${host}${path}`);
  }
  return urls;
}

async function tryFeed(url: string, sourceName: string): Promise<NewsArticle[] | null> {
  try {
    const res = await fetchText(url);
    if (res.status >= 400 || !isFeedXml(res.text)) return null;
    const items = parseFeed(res.text, sourceName);
    return items.length ? items : null;
  } catch {
    return null;
  }
}

async function googleNewsFeed(domain: string): Promise<NewsArticle[]> {
  const q = encodeURIComponent(`site:${domain} when:14d`);
  const url = `https://news.google.com/rss/search?q=${q}&hl=en-US&gl=US&ceid=US:en`;
  const res = await fetchText(url);
  if (res.status >= 400 || !isFeedXml(res.text)) return [];
  return parseFeed(res.text, domain).filter((item) => {
    const title = item.title.replace(/\s*-\s*[^-]+$/, '').trim();
    return title.length > 12;
  });
}

export interface SiteFetchNote {
  domain: string;
  count: number;
  via: 'rss' | 'google-news' | 'none';
  detail?: string;
}

export async function fetchFromWebsites(domains: string[]): Promise<{
  articles: NewsArticle[];
  notes: SiteFetchNote[];
}> {
  const notes: SiteFetchNote[] = [];
  const seen = new Set<string>();
  const collected: NewsArticle[] = [];

  for (const domain of domains) {
    let items: NewsArticle[] | null = null;
    let via: SiteFetchNote['via'] = 'none';

    for (const url of feedCandidates(domain)) {
      items = await tryFeed(url, domain);
      if (items?.length) {
        via = 'rss';
        break;
      }
    }

    if (!items?.length) {
      try {
        const googleItems = await googleNewsFeed(domain);
        if (googleItems.length) {
          items = googleItems;
          via = 'google-news';
        }
      } catch (err) {
        notes.push({
          domain,
          count: 0,
          via: 'none',
          detail: err instanceof Error ? err.message : String(err),
        });
        continue;
      }
    }

    const kept = (items || []).slice(0, PER_SITE_LIMIT);
    let added = 0;
    for (const article of kept) {
      if (seen.has(article.url)) continue;
      seen.add(article.url);
      collected.push(article);
      added += 1;
    }
    notes.push({ domain, count: added, via, detail: via === 'none' ? 'no feed found' : undefined });
  }

  collected.sort((a, b) => +new Date(b.publishedAt) - +new Date(a.publishedAt));
  return { articles: collected, notes };
}
