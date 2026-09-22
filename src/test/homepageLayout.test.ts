import { describe, expect, it } from "vitest";
import { assignHomepageSections, type HomepageArticle } from "@/lib/homepageLayout";

const NOW = new Date(2026, 8, 22); // Tuesday, 22 Sep 2026 — week starts Mon 21

const makeArticle = (
  index: number,
  overrides: Partial<HomepageArticle> = {}
): HomepageArticle => ({
  id: String(index),
  slug: `article-${index}`,
  title: `Article ${index}`,
  excerpt: "Excerpt",
  author: "Editor",
  category: `Cat ${index % 4}`,
  readTime: `${(index % 7) + 3} min read`,
  date: `Sep ${index}, 2026`,
  publishedOn: `2026-08-${String(Math.min(index, 28)).padStart(2, "0")}`,
  featuredImage: null,
  ...overrides,
});

describe("assignHomepageSections", () => {
  it("gives Latest four unused stories after the front page", () => {
    const pool = Array.from({ length: 20 }, (_, i) => makeArticle(i + 1));
    const sections = assignHomepageSections(pool, { now: NOW });
    expect(sections.latest.map((article) => article.slug)).toEqual([
      "article-7",
      "article-8",
      "article-9",
      "article-10",
    ]);
    expect(sections.hero).toHaveLength(6);
  });

  it("never repeats an article across homepage rails", () => {
    const pool = Array.from({ length: 22 }, (_, i) => makeArticle(i + 1));
    const sections = assignHomepageSections(pool, { now: NOW });
    const keys = [
      ...sections.hero,
      ...sections.latest,
      ...sections.featured,
      ...sections.topFive,
    ].map((article) => article.slug);

    expect(new Set(keys).size).toBe(keys.length);
  });

  it("fills Five to watch from the current calendar week only", () => {
    const pool = [
      ...Array.from({ length: 12 }, (_, i) =>
        makeArticle(i + 1, { publishedOn: `2026-09-${String(21 + (i % 2)).padStart(2, "0")}` })
      ),
      ...Array.from({ length: 8 }, (_, i) =>
        makeArticle(i + 13, { publishedOn: `2026-08-${String(i + 1).padStart(2, "0")}` })
      ),
    ];
    const sections = assignHomepageSections(pool, { now: NOW });

    expect(sections.topFive).toHaveLength(5);
    expect(sections.topFive.every((article) => article.publishedOn?.startsWith("2026-09-2"))).toBe(
      true
    );
    const used = new Set(
      [...sections.hero, ...sections.latest, ...sections.featured, ...sections.topFive].map(
        (article) => article.slug
      )
    );
    expect(used.size).toBe(
      sections.hero.length +
        sections.latest.length +
        sections.featured.length +
        sections.topFive.length
    );
  });

  it("prefers non-news essays for Featured after the newest rails are filled", () => {
    const pool = [
      ...Array.from({ length: 10 }, (_, i) =>
        makeArticle(i + 1, { category: "General News", readTime: "3 min read" })
      ),
      makeArticle(11, { category: "Insights", readTime: "5 min read" }),
      makeArticle(12, { category: "Insights", readTime: "4 min read" }),
      makeArticle(13, { category: "General News", readTime: "8 min read" }),
    ];
    const sections = assignHomepageSections(pool, { now: NOW });
    expect(sections.featured.map((article) => article.slug)).toEqual([
      "article-11",
      "article-12",
      "article-13",
    ]);
  });

  it("still works when the pool is smaller than the full layout", () => {
    const pool = Array.from({ length: 8 }, (_, i) => makeArticle(i + 1));
    const sections = assignHomepageSections(pool, { now: NOW });
    const keys = [
      ...sections.hero,
      ...sections.latest,
      ...sections.featured,
      ...sections.topFive,
    ].map((article) => article.slug);

    expect(sections.hero).toHaveLength(6);
    expect(sections.latest).toHaveLength(2);
    expect(sections.featured).toHaveLength(0);
    expect(sections.topFive).toHaveLength(0);
    expect(new Set(keys).size).toBe(keys.length);
  });
});
