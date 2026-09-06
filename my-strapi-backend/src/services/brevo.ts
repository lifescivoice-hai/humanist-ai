import { BrevoClient } from '@getbrevo/brevo';

const DEFAULT_LIST_NAME = 'The Humanist AI Newsletter';

let cachedListId: number | null = null;
let cachedClient: BrevoClient | null = null;

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

function client() {
  if (!cachedClient) {
    cachedClient = new BrevoClient({ apiKey: apiKey() });
  }
  return cachedClient;
}

function sdkMessage(err: unknown) {
  if (err && typeof err === 'object' && 'body' in err) {
    const body = (err as { body?: { message?: string } }).body;
    if (body?.message) return body.message;
  }
  return err instanceof Error ? err.message : 'Brevo request failed';
}

async function resolveFolderId(): Promise<number> {
  const folders = await client().contacts.getFolders({ limit: 50 });
  const existing = folders.folders?.find((folder) => folder.id);
  if (existing?.id) return existing.id;

  const created = await client().contacts.createFolder({ name: 'The Humanist AI' });
  if (!created.id) {
    throw new Error('Brevo did not return a folder id');
  }
  return created.id;
}

async function findListId(name: string): Promise<number | null> {
  let offset = 0;
  for (let page = 0; page < 10; page += 1) {
    const data = await client().contacts.getLists({ limit: 50, offset });
    const match = data.lists?.find((list) => list.name === name && list.id);
    if (match?.id) return match.id;
    if (!data.lists?.length || data.lists.length < 50) break;
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
  const created = await client().contacts.createList({ name, folderId });
  if (!created.id) {
    throw new Error('Brevo did not return a list id');
  }
  cachedListId = created.id;
  return created.id;
}

export async function addSubscriber(email: string) {
  try {
    const listId = await ensureNewsletterListId();
    await client().contacts.createContact({
      email,
      listIds: [listId],
      updateEnabled: true,
    });
    return { listId };
  } catch (err) {
    throw new Error(sdkMessage(err));
  }
}

export function isValidEmail(value: string) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
}
