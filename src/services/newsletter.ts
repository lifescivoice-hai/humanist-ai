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
    throw new Error(json.error?.message || 'Could not subscribe. Please try again.');
  }

  return json.data;
}
