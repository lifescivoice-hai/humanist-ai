import { addSubscriber, isValidEmail } from '../../../services/brevo';

type Ctx = {
  request: { body?: { email?: unknown } };
  badRequest: (msg?: string) => unknown;
  body: unknown;
};

export default {
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
      ctx.body = { error: { message } };
      (ctx as { status?: number }).status = 502;
    }
  },
};
