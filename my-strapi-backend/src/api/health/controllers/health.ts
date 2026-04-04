/**
 * Public health check.
 */

export default {
  check(ctx: { set: (k: string, v: string) => void; body: unknown }) {
    ctx.set('Cache-Control', 'no-store');
    ctx.body = { message: 'healthy' };
  },
};
