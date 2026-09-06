import { API_URL } from '@/lib/api';

export async function subscribeToNewsletter(email: string) {
  const res = await fetch(`${API_URL}/newsletter/subscribe`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email }),
  });

  const json = (await res.json().catch(() => ({}))) as {
    data?: { subscribed?: boolean };
    error?: { message?: string };
  };

  if (!res.ok) {
    const detail = json.error?.message;
    if (res.status === 404 || res.status === 405) {
      throw new Error('Newsletter API is not live on the server yet. Pull and restart Strapi.');
    }
    throw new Error(detail || `Could not subscribe (${res.status}).`);
  }

  return json.data;
}
