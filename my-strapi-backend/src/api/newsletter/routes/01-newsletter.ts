/**
 * Public newsletter signup. Mounted at POST /api/newsletter/subscribe
 */

export default {
  type: 'content-api' as const,
  routes: [
    {
      method: 'POST',
      path: '/newsletter/subscribe',
      handler: 'api::newsletter.newsletter.subscribe',
      config: { auth: false },
    },
  ],
};
