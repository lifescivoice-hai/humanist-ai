import type { PipelineConfig, QueuePayload, RunsPage } from './types';

const TOKEN_KEY = 'pipeline.token';
const URL_KEY = 'pipeline.apiUrl';

export function getApiUrl() {
  return (
    localStorage.getItem(URL_KEY) ||
    import.meta.env.VITE_STRAPI_URL ||
    'http://localhost:1338'
  ).replace(/\/$/, '');
}

export function setApiUrl(url: string) {
  localStorage.setItem(URL_KEY, url.replace(/\/$/, ''));
}

export function getToken() {
  return localStorage.getItem(TOKEN_KEY) || import.meta.env.VITE_PIPELINE_TOKEN || '';
}

export function setToken(token: string) {
  localStorage.setItem(TOKEN_KEY, token.trim());
}

export function clearSession() {
  localStorage.removeItem(TOKEN_KEY);
}

async function request<T>(path: string, init: RequestInit = {}): Promise<T> {
  const token = getToken();
  const res = await fetch(`${getApiUrl()}/api${path}`, {
    ...init,
    headers: {
      'Content-Type': 'application/json',
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
      ...(init.headers || {}),
    },
  });

  const json = (await res.json().catch(() => ({}))) as {
    data?: T;
    error?: { message?: string };
    meta?: RunsPage['meta'];
  };

  if (!res.ok) {
    throw new Error(json.error?.message || `${res.status} ${res.statusText}`);
  }

  return json as T;
}

export async function fetchConfig() {
  const json = await request<{ data: PipelineConfig }>('/pipeline/config');
  return json.data;
}

export async function saveConfig(body: Partial<PipelineConfig>) {
  const json = await request<{ data: PipelineConfig }>('/pipeline/config', {
    method: 'PUT',
    body: JSON.stringify(body),
  });
  return json.data;
}

export async function fetchRuns(page = 1, pageSize = 20) {
  return request<RunsPage>(`/pipeline/runs?page=${page}&pageSize=${pageSize}`);
}

export async function runNow() {
  const json = await request<{ data: unknown }>('/pipeline/run-now', { method: 'POST' });
  return json.data;
}

export async function fetchQueue() {
  const json = await request<{ data: QueuePayload }>('/pipeline/queue');
  return json.data;
}

export async function approveArticle(id: string) {
  return request(`/pipeline/articles/${id}/approve`, { method: 'POST' });
}

export async function rejectArticle(id: string) {
  return request(`/pipeline/articles/${id}/reject`, { method: 'POST' });
}

export function strapiAdminEditUrl(documentId: string) {
  return `${getApiUrl()}/admin/content-manager/collection-types/api::article.article/${documentId}`;
}
