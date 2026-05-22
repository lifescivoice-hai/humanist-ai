import { useEffect, useState } from 'react';
import { useQuery } from '@tanstack/react-query';
import {
  fetchArticleById,
  fetchArticleBySlug,
  fetchLatestArticles,
  fetchArticles,
  fetchCategories,
  fetchCategoryPageData,
  fetchHomepage,
  fetchMenuItems,
  searchArticles,
} from '@/services/strapi';

// Hook to fetch single article by ID
export const useArticle = (id: string | undefined) => {
  return useQuery({
    queryKey: ['article', id],
    queryFn: () => fetchArticleById(id!),
    enabled: !!id,
    staleTime: 5 * 60 * 1000, // Cache for 5 minutes
  });
};

// Hook to fetch single article by slug
export const useArticleBySlug = (slug: string | undefined) => {
  return useQuery({
    queryKey: ['article', 'slug', slug],
    queryFn: () => fetchArticleBySlug(slug!),
    enabled: !!slug,
    staleTime: 5 * 60 * 1000,
  });
};

// Hook to fetch latest articles
export const useLatestArticles = (limit: number = 5) => {
  return useQuery({
    queryKey: ['articles', 'latest', limit],
    queryFn: () => fetchLatestArticles(limit),
    staleTime: 2 * 60 * 1000, // Cache for 2 minutes
  });
};

// Hook to fetch paginated articles
export const useArticles = (page: number = 1, pageSize: number = 10) => {
  return useQuery({
    queryKey: ['articles', 'list', page, pageSize],
    queryFn: () => fetchArticles(page, pageSize),
    staleTime: 2 * 60 * 1000,
  });
};

export const useCategories = (limit: number = 50) => {
  return useQuery({
    queryKey: ['categories', limit],
    queryFn: () => fetchCategories(limit),
    staleTime: 10 * 60 * 1000,
  });
};

export const useCategoryPage = (
  slug: string | undefined,
  page: number = 1,
  pageSize: number = 12
) => {
  return useQuery({
    queryKey: ['category', 'page', slug, page, pageSize],
    queryFn: () => fetchCategoryPageData(slug!, page, pageSize),
    enabled: !!slug,
    staleTime: 2 * 60 * 1000,
  });
};

/**
 * Debounced article search. `query` is delayed by `delayMs` before triggering
 * the network call, so we don't fire a request on every keystroke.
 * Returns `{ data, isLoading, isError, error, debouncedQuery }`.
 */
export const useSearchArticles = (query: string, delayMs: number = 300, limit: number = 20) => {
  const [debouncedQuery, setDebouncedQuery] = useState(query);

  useEffect(() => {
    const id = setTimeout(() => setDebouncedQuery(query), delayMs);
    return () => clearTimeout(id);
  }, [query, delayMs]);

  const trimmed = debouncedQuery.trim();

  const queryResult = useQuery({
    queryKey: ['articles', 'search', trimmed, limit],
    queryFn: () => searchArticles(trimmed, limit),
    enabled: trimmed.length >= 2,
    staleTime: 60 * 1000,
  });

  return { ...queryResult, debouncedQuery: trimmed };
};

/**
 * Curated homepage selections from the Strapi `homepage` single type.
 * Returns ordered lists for each section (hero, featured, weekly top, weekly titles).
 */
export const useHomepage = () => {
  return useQuery({
    queryKey: ['homepage'],
    queryFn: fetchHomepage,
    staleTime: 2 * 60 * 1000,
  });
};

export const useMenuItems = (location: 'header' | 'footer' | 'both' = 'header') => {
  return useQuery({
    queryKey: ['menu-items', location],
    queryFn: () => fetchMenuItems(location),
    staleTime: 10 * 60 * 1000,
  });
};
