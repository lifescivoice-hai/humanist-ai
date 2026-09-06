import { addSubscriber, isValidEmail } from '../../../services/brevo';

type Ctx = {
  request: { body?: { email?: unknown } };
  badRequest: (msg?: string) => unknown;
  body: unknown;
};

export default {
  info(ctx: { body: unknown }) {
    ctx.body = {
      ok: true,
      message: 'Newsletter subscribe is live. Send POST with { "email": "you@example.com" }.',
    };
  },

  async subscribe(ctx: Ctx) {
    const raw = typeof ctx.request.body?.email === 'string' ? ctx.request.body.email.trim() : '';
    if (!isValidEmail(raw)) {
      return ctx.badRequest('Enter a valid email address');
    }

    try {
      const { listId } = await addSubscriber(raw.toLowerCase());
      ctx.body = { data: { subscribed: true, listId } };
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Subscribe failed';
      (ctx as { status?: number }).status = /BREVO_API_KEY/i.test(message) ? 503 : 502;
      ctx.body = { error: { message } };
    }
  },
};
