import { API_URL, getStrapiImageUrl, formatStrapiDate } from '@/lib/api';

// Strapi API response types (supports both v4 and v5)
interface StrapiResponse<T> {
  data: T;
  meta?: {
    pagination?: {
      page: number;
      pageSize: number;
      pageCount: number;
      total: number;
    };
  };
}

// Rich text node types from Strapi v5
interface RichTextNode {
  type: string;
  children?: RichTextNode[];
  text?: string;
  bold?: boolean;
  italic?: boolean;
  underline?: boolean;
  [key: string]: any;
}

/** Strapi Category entry (flat or nested) */
export interface StrapiCategory {
  id?: number;
  documentId?: string;
  name?: string;
  slug?: string;
  description?: string;
  attributes?: { name?: string; slug?: string; description?: string };
}

interface ArticleAttributes {
  title: string;
  slug: string;
  excerpt: string;
  content: string | RichTextNode[]; // Can be HTML string (v4) or Rich text array (v5)
  /** Legacy text field (still on Article schema) */
  category?: string;
  categories?: StrapiCategory[] | { data?: StrapiCategory[] };
  author: string;
  publishedAt: string;
  readTime: number;
  featuredImage?: {
    data?: {
      attributes?: {
        url: string;
        alternativeText?: string;
      };
      url?: string; // Strapi v5
    };
  };
}

interface Article {
  id: number;
  documentId?: string; // Strapi v5
  attributes?: ArticleAttributes; // Strapi v4
  // For Strapi v5, attributes are flattened
  title?: string;
  slug?: string;
  excerpt?: string;
  content?: string | RichTextNode[];
  category?: string;
  categories?: ArticleAttributes['categories'];
  author?: string;
  publishedAt?: string;
  readTime?: number;
  featuredImage?: ArticleAttributes['featuredImage'];
}

/** Query fragment: populate media + related categories */
const ARTICLE_POPULATE_QS =
  'populate[featuredImage]=true&populate[categories]=true';

/**
 * Sort by the editorial `published` date set in the admin (a manual `date` field
 * that does NOT change on re-publish), then fall back to `publishedAt` for any
 * entries where `published` is empty.
 */
const ARTICLE_SORT_QS = 'sort[0]=published:desc&sort[1]=publishedAt:desc';

const normalizeCategoryList = (raw: ArticleAttributes['categories']): StrapiCategory[] => {
  if (!raw) return [];
  if (Array.isArray(raw)) return raw;
  if (typeof raw === 'object' && 'data' in raw && Array.isArray(raw.data)) return raw.data as StrapiCategory[];
  return [];
};

const categoryDisplayName = (c: StrapiCategory): string =>
  c?.name ?? c?.attributes?.name ?? '';

/** Primary label for badges (first related category, else legacy string field) */
export const resolveArticleCategory = (
  attrs: Pick<ArticleAttributes, 'category' | 'categories'>
): string => {
  const list = normalizeCategoryList(attrs.categories);
  const first = list.map(categoryDisplayName).find(Boolean);
  if (first) return first;
  if (attrs.category) return attrs.category;
  return 'Uncategorized';
};

export interface TransformedCategory {
  id: string;
  name: string;
  slug: string;
  description: string;
}

interface StrapiMenuItem {
  id?: number;
  documentId?: string;
  label?: string;
  path?: string;
  order?: number;
  isActive?: boolean;
  openInNewTab?: boolean;
  location?: "header" | "footer" | "both";
  attributes?: {
    label?: string;
    path?: string;
    order?: number;
    isActive?: boolean;
    openInNewTab?: boolean;
    location?: "header" | "footer" | "both";
  };
}

export interface TransformedMenuItem {
  id: string;
  label: string;
  path: string;
  order: number;
  isActive: boolean;
  openInNewTab: boolean;
  location: "header" | "footer" | "both";
}

const transformMenuItem = (item: StrapiMenuItem): TransformedMenuItem => {
  const attrs = item.attributes || item;
  return {
    id: String(item.id ?? item.documentId ?? `${attrs.label ?? "menu-item"}`),
    label: attrs.label || "Untitled",
    path: attrs.path || "/",
    order: attrs.order ?? 999,
    isActive: attrs.isActive ?? true,
    openInNewTab: attrs.openInNewTab ?? false,
    location: attrs.location ?? "header",
  };
};

const transformCategory = (c: StrapiCategory): TransformedCategory => {
  const name = categoryDisplayName(c);
  const slug =
    (typeof c?.slug === 'string' && c.slug) ||
    c?.attributes?.slug ||
    name.toLowerCase().replace(/\s+/g, '-');
  return {
    id: String(c?.id ?? c?.documentId ?? slug),
    name: name || 'Untitled',
    slug,
    description: typeof c?.description === 'string' ? c.description : '',
  };
};

export const transformCategoryEntry = transformCategory;

// Convert Strapi Rich text content to HTML
const convertRichTextToHTML = (content: string | RichTextNode[]): string => {
  // If it's already a string (HTML), return as-is
  if (typeof content === 'string') {
    return content;
  }
  
  // If it's an array (Rich text format), convert to HTML
  if (Array.isArray(content)) {
    return content.map(node => convertRichTextNode(node)).join('');
  }
  
  return '';
};

// Convert a single Rich text node to HTML
const convertRichTextNode = (node: RichTextNode): string => {
  if (!node) return '';
  
  // Text node
  if (node.type === 'text' && node.text) {
    let text = node.text;
    if (node.bold) text = `<strong>${text}</strong>`;
    if (node.italic) text = `<em>${text}</em>`;
    if (node.underline) text = `<u>${text}</u>`;
    return text;
  }
  
  // Paragraph
  if (node.type === 'paragraph' && node.children) {
    const content = node.children.map(convertRichTextNode).join('');
    return `<p>${content}</p>`;
  }
  
  // Heading
  // Strapi v5 blocks: { type: 'heading', level: 1-6, children: [...] }
  // Legacy/Slate format: { type: 'heading-one' | 'heading-two' | ... }
  if (node.type === 'heading' && node.children) {
    const rawLevel = typeof node.level === 'number' ? node.level : Number(node.level);
    const level = Number.isFinite(rawLevel) && rawLevel >= 1 && rawLevel <= 6 ? rawLevel : 2;
    const content = node.children.map(convertRichTextNode).join('');
    return `<h${level}>${content}</h${level}>`;
  }

  if (node.type?.startsWith('heading-') && node.children) {
    const map: Record<string, number> = {
      'heading-one': 1,
      'heading-two': 2,
      'heading-three': 3,
      'heading-four': 4,
      'heading-five': 5,
      'heading-six': 6,
    };
    const level = map[node.type] ?? 2;
    const content = node.children.map(convertRichTextNode).join('');
    return `<h${level}>${content}</h${level}>`;
  }
  
  // List
  if (node.type === 'list' && node.children) {
    const tag = node.format === 'ordered' ? 'ol' : 'ul';
    const content = node.children.map(child => {
      if (child.type === 'list-item' && child.children) {
        const itemContent = child.children.map(convertRichTextNode).join('');
        return `<li>${itemContent}</li>`;
      }
      return '';
    }).join('');
    return `<${tag}>${content}</${tag}>`;
  }
  
  // Link
  if (node.type === 'link' && node.children) {
    const content = node.children.map(convertRichTextNode).join('');
    const url = node.url || '#';
    return `<a href="${url}">${content}</a>`;
  }
  
  // Default: process children if they exist
  if (node.children && Array.isArray(node.children)) {
    return node.children.map(convertRichTextNode).join('');
  }
  
  return '';
};

// Transform Strapi article to your app's format
export const transformArticle = (article: Article) => {
  // Handle Strapi v4 (with attributes) and v5 (flattened)
  const attrs = article.attributes || article;

  // Convert Rich text content to HTML
  const content = convertRichTextToHTML(attrs.content || '');

  const featuredImageUrl = getStrapiImageUrl(attrs.featuredImage);

  const categoryLabel = resolveArticleCategory({
    category: attrs.category,
    categories: attrs.categories,
  });

  return {
    id: String(article.id || article.documentId || ''),
    title: attrs.title || '',
    slug: attrs.slug || '',
    excerpt: attrs.excerpt || '',
    content: content,
    category: categoryLabel,
    author: attrs.author || '',
    date: formatStrapiDate(attrs.publishedAt || ''),
    readTime: `${attrs.readTime ?? 5} min read`,
    featuredImage: featuredImageUrl,
  };
};

// Fetch single article by ID
export const fetchArticleById = async (id: string): Promise<ReturnType<typeof transformArticle>> => {
  const response = await fetch(`${API_URL}/articles/${id}?${ARTICLE_POPULATE_QS}`);
  if (!response.ok) {
    throw new Error(`Failed to fetch article: ${response.statusText}`);
  }
  const data: StrapiResponse<Article> = await response.json();
  return transformArticle(data.data);
};

// Fetch single article by slug
export const fetchArticleBySlug = async (slug: string): Promise<ReturnType<typeof transformArticle>> => {
  // Strapi v5 API - try different query formats
  const url = `${API_URL}/articles?filters[slug][$eq]=${encodeURIComponent(slug)}&${ARTICLE_POPULATE_QS}`;

  const response = await fetch(url);

  if (!response.ok) {
    throw new Error(`Failed to fetch article: ${response.status} ${response.statusText}`);
  }

  const data: StrapiResponse<Article[]> = await response.json();

  if (!data.data || data.data.length === 0) {
    throw new Error(`Article not found with slug: "${slug}"`);
  }
  
  return transformArticle(data.data[0]);
};

// Fetch latest articles
export const fetchLatestArticles = async (limit: number = 5): Promise<ReturnType<typeof transformArticle>[]> => {
  // Strapi v5 populate syntax: use populate=featuredImage
  const response = await fetch(
    `${API_URL}/articles?${ARTICLE_SORT_QS}&pagination[limit]=${limit}&${ARTICLE_POPULATE_QS}`
  );
  if (!response.ok) {
    throw new Error(`Failed to fetch articles: ${response.statusText}`);
  }
  const data: StrapiResponse<Article[]> = await response.json();
  return (data.data || []).map(transformArticle);
};

// Fetch all articles (for listing pages)
export const fetchArticles = async (page: number = 1, pageSize: number = 10) => {
  // Strapi v5 populate syntax: use populate=featuredImage
  const response = await fetch(
    `${API_URL}/articles?${ARTICLE_SORT_QS}&pagination[page]=${page}&pagination[pageSize]=${pageSize}&${ARTICLE_POPULATE_QS}`
  );
  if (!response.ok) {
    throw new Error(`Failed to fetch articles: ${response.statusText}`);
  }
  const data: StrapiResponse<Article[]> = await response.json();
  return {
    articles: (data.data || []).map(transformArticle),
    pagination: data.meta?.pagination,
  };
};

/** All published categories (for nav / trending) */
export const fetchCategories = async (
  limit: number = 50
): Promise<TransformedCategory[]> => {
  const qs = `sort=name:asc&pagination[pageSize]=${limit}`;
  const response = await fetch(`${API_URL}/categories?${qs}`);
  if (!response.ok) {
    throw new Error(`Failed to fetch categories: ${response.statusText}`);
  }
  const data: StrapiResponse<StrapiCategory[]> = await response.json();
  const rows = data.data || [];
  return rows.map((c) => transformCategory(c));
};

export interface CategoryPageData {
  category: TransformedCategory | null;
  articles: ReturnType<typeof transformArticle>[];
  pagination?: {
    page: number;
    pageSize: number;
    pageCount: number;
    total: number;
  };
}

/**
 * Category landing: resolve category by slug, then articles linked to that category (relation id filter).
 */
export const fetchCategoryPageData = async (
  categorySlug: string,
  page: number = 1,
  pageSize: number = 12
): Promise<CategoryPageData> => {
  const catUrl = `${API_URL}/categories?filters[slug][$eq]=${encodeURIComponent(categorySlug)}&pagination[pageSize]=1`;
  const catRes = await fetch(catUrl);
  if (!catRes.ok) {
    throw new Error(`Failed to fetch category: ${catRes.statusText}`);
  }
  const catJson: StrapiResponse<StrapiCategory[]> = await catRes.json();
  const catRaw = catJson.data?.[0];
  if (!catRaw) {
    return { category: null, articles: [], pagination: undefined };
  }

  const category = transformCategory(catRaw);
  const catId = catRaw.id;
  if (catId === undefined || catId === null) {
    return { category, articles: [], pagination: undefined };
  }

  const artUrl = `${API_URL}/articles?filters[categories][id][$eq]=${catId}&${ARTICLE_SORT_QS}&pagination[page]=${page}&pagination[pageSize]=${pageSize}&${ARTICLE_POPULATE_QS}`;
  const artRes = await fetch(artUrl);
  if (!artRes.ok) {
    throw new Error(`Failed to fetch articles: ${artRes.statusText}`);
  }
  const artJson: StrapiResponse<Article[]> = await artRes.json();
  return {
    category,
    articles: (artJson.data || []).map(transformArticle),
    pagination: artJson.meta?.pagination,
  };
};

export const fetchMenuItems = async (
  location: "header" | "footer" | "both" = "header"
): Promise<TransformedMenuItem[]> => {
  // Strapi 5: avoid fragile $in[index] filters — fetch active items and filter by location here.
  const qs =
    `filters[isActive][$eq]=true&` +
    `sort=order:asc&` +
    `pagination[pageSize]=100&` +
    `status=published`;

  const response = await fetch(`${API_URL}/menu-items?${qs}`);
  if (!response.ok) {
    const detail = await response.text().catch(() => '');
    throw new Error(
      `Failed to fetch menu items: ${response.status} ${response.statusText}${detail ? ` — ${detail.slice(0, 200)}` : ''}`
    );
  }

  const data: StrapiResponse<StrapiMenuItem[]> = await response.json();
  const rows = (data.data || []).map(transformMenuItem);
  return rows.filter((item) => {
    if (location === "both") return item.location === "both";
    return item.location === location || item.location === "both";
  });
};
