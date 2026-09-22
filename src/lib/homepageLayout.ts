export type HomepageArticle = {
  id: string;
  slug: string;
  title: string;
  excerpt: string;
  author: string;
  category: string;
  readTime: string;
  date: string;
  /** Raw Strapi date (`YYYY-MM-DD` or ISO). Used to decide the current week. */
  publishedOn?: string;
  featuredImage?: string | null;
};

export type HomepageSections = {
  hero: HomepageArticle[];
  latest: HomepageArticle[];
  featured: HomepageArticle[];
  topFive: HomepageArticle[];
};

export const HOMEPAGE_ARTICLE_POOL = 30;
export const LATEST_COUNT = 4;
export const TOP_FIVE_COUNT = 5;

export type HomepageLayoutOptions = {
  now?: Date;
};

const articleKey = (article: HomepageArticle): string => article.slug || article.id;

const readMinutes = (article: HomepageArticle): number => {
  const minutes = parseInt(String(article.readTime), 10);
  return Number.isFinite(minutes) ? minutes : 0;
};

export const parseArticleDate = (article: HomepageArticle): Date | null => {
  const raw = article.publishedOn || article.date;
  if (!raw) return null;

  const dateOnly = /^(\d{4})-(\d{2})-(\d{2})/.exec(raw);
  if (dateOnly) {
    return new Date(Number(dateOnly[1]), Number(dateOnly[2]) - 1, Number(dateOnly[3]));
  }

  const parsed = new Date(raw);
  return Number.isNaN(parsed.getTime()) ? null : parsed;
};

/** Monday 00:00 local through the following Sunday. */
export const startOfCurrentWeek = (now: Date = new Date()): Date => {
  const start = new Date(now.getFullYear(), now.getMonth(), now.getDate());
  const weekday = start.getDay();
  start.setDate(start.getDate() + (weekday === 0 ? -6 : 1 - weekday));
  return start;
};

export const isInCurrentWeek = (article: HomepageArticle, now: Date = new Date()): boolean => {
  const published = parseArticleDate(article);
  if (!published) return false;
  const start = startOfCurrentWeek(now);
  const end = new Date(start);
  end.setDate(end.getDate() + 7);
  return published >= start && published < end;
};

const takeNext = (
  pool: HomepageArticle[],
  used: Set<string>,
  count: number
): HomepageArticle[] => {
  const picked: HomepageArticle[] = [];
  for (const article of pool) {
    const key = articleKey(article);
    if (!key || used.has(key)) continue;
    used.add(key);
    picked.push(article);
    if (picked.length === count) break;
  }
  return picked;
};

const isEssay = (article: HomepageArticle): boolean => {
  const category = (article.category || "").toLowerCase();
  return Boolean(category) && category !== "general news" && category !== "uncategorized";
};

const takeDiverse = (
  pool: HomepageArticle[],
  used: Set<string>,
  count: number
): HomepageArticle[] => {
  const picked: HomepageArticle[] = [];
  const seenCategories = new Set<string>();

  for (const article of pool) {
    const key = articleKey(article);
    if (!key || used.has(key) || seenCategories.has(article.category)) continue;
    used.add(key);
    seenCategories.add(article.category);
    picked.push(article);
    if (picked.length === count) return picked;
  }

  return picked.concat(takeNext(pool, used, count - picked.length));
};

/**
 * Split one newest-first pool into non-overlapping homepage rails.
 * Latest is the next four after the front page. Five to watch is reserved
 * for the current calendar week so it does not just repeat leftover latest.
 */
export const assignHomepageSections = (
  pool: HomepageArticle[],
  options: HomepageLayoutOptions = {}
): HomepageSections => {
  const now = options.now ?? new Date();
  const used = new Set<string>();
  const thisWeek = pool.filter((article) => isInCurrentWeek(article, now));

  let hero: HomepageArticle[];
  let latest: HomepageArticle[];
  let topFive: HomepageArticle[];

  if (thisWeek.length > 0 && thisWeek.length <= 6) {
    topFive = takeDiverse(thisWeek, used, TOP_FIVE_COUNT);
    hero = takeNext(pool, used, 6);
    latest = takeNext(pool, used, LATEST_COUNT);
  } else {
    hero = takeNext(pool, used, 6);
    topFive = takeDiverse(thisWeek, used, TOP_FIVE_COUNT);
    latest = takeNext(pool, used, LATEST_COUNT);
  }

  const remaining = pool.filter((article) => !used.has(articleKey(article)));
  const byDepth = [...remaining].sort((a, b) => {
    const score = (article: HomepageArticle) => (isEssay(article) ? 100 : 0) + readMinutes(article);
    return score(b) - score(a);
  });
  const featured = takeNext(byDepth, used, 5);

  return { hero, latest, featured, topFive };
};
