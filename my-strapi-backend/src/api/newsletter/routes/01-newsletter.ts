/**
 * Public newsletter signup. Mounted at /api/newsletter/subscribe
 */

export default {
  type: 'content-api' as const,
  routes: [
    {
      method: 'GET',
      path: '/newsletter-subscribe',
      handler: 'api::newsletter.newsletter.info',
      config: { auth: false },
    },
    {
      method: 'POST',
      path: '/newsletter-subscribe',
      handler: 'api::newsletter.newsletter.subscribe',
      config: { auth: false },
    },
  ],
};
