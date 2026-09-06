/**
 * GET /api/health → { "message": "healthy" }
 * POST /api/newsletter-subscribe → add email to Brevo
 */

export default {
  type: 'content-api' as const,
  routes: [
    {
      method: 'GET',
      path: '/health',
      handler: 'api::health.health.check',
      config: {
        auth: false,
      },
    },
    {
      method: 'GET',
      path: '/newsletter-subscribe',
      handler: 'api::health.health.newsletterInfo',
      config: { auth: false },
    },
    {
      method: 'POST',
      path: '/newsletter-subscribe',
      handler: 'api::health.health.newsletterSubscribe',
      config: { auth: false },
    },
  ],
};
