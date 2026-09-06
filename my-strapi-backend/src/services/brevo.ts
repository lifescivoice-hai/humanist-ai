const BREVO_API = 'https://api.brevo.com/v3';
const DEFAULT_LIST_NAME = 'The Humanist AI Newsletter';

let cachedListId: number | null = null;

function apiKey() {
  const key = (process.env.BREVO_API_KEY || '').trim();
  if (!key) {
    throw new Error('BREVO_API_KEY is not set');
  }
  return key;
}

function listName() {
  return (process.env.BREVO_LIST_NAME || '').trim() || DEFAULT_LIST_NAME;
}

async function brevoFetch<T>(path: string, init: RequestInit = {}): Promise<T> {
  const res = await fetch(`${BREVO_API}${path}`, {
    ...init,
    headers: {
      accept: 'application/json',
      'content-type': 'application/json',
      'api-key': apiKey(),
      ...(init.headers || {}),
    },
  });
  const text = await res.text();
  const body = text ? (JSON.parse(text) as T & { message?: string }) : ({} as T);
  if (!res.ok) {
    const message = (body as { message?: string }).message || text.slice(0, 240) || `HTTP ${res.status}`;
    throw new Error(message);
  }
  return body;
}

async function resolveFolderId(): Promise<number> {
  const data = await brevoFetch<{ folders?: Array<{ id?: number }> }>('/contacts/folders?limit=50');
  const existing = data.folders?.find((folder) => folder.id);
  if (existing?.id) return existing.id;

  const created = await brevoFetch<{ id: number }>('/contacts/folders', {
    method: 'POST',
    body: JSON.stringify({ name: 'The Humanist AI' }),
  });
  return created.id;
}

async function findListId(name: string): Promise<number | null> {
  let offset = 0;
  for (let page = 0; page < 10; page += 1) {
    const data = await brevoFetch<{ lists?: Array<{ id?: number; name?: string }>; count?: number }>(
      `/contacts/lists?limit=50&offset=${offset}`
    );
    const match = data.lists?.find((list) => list.name === name && list.id);
    if (match?.id) return match.id;
    if (!data.lists?.length || (data.lists.length < 50)) break;
    offset += 50;
  }
  return null;
}

export async function ensureNewsletterListId(): Promise<number> {
  const fromEnv = Number(process.env.BREVO_LIST_ID);
  if (Number.isInteger(fromEnv) && fromEnv > 0) {
    cachedListId = fromEnv;
    return fromEnv;
  }
  if (cachedListId) return cachedListId;

  const name = listName();
  const existing = await findListId(name);
  if (existing) {
    cachedListId = existing;
    return existing;
  }

  const folderId = await resolveFolderId();
  const created = await brevoFetch<{ id: number }>('/contacts/lists', {
    method: 'POST',
    body: JSON.stringify({ name, folderId }),
  });
  cachedListId = created.id;
  return created.id;
}

export async function addSubscriber(email: string) {
  const listId = await ensureNewsletterListId();
  await brevoFetch('/contacts', {
    method: 'POST',
    body: JSON.stringify({
      email,
      listIds: [listId],
      updateEnabled: true,
    }),
  });
  return { listId };
}

export function isValidEmail(value: string) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
}
