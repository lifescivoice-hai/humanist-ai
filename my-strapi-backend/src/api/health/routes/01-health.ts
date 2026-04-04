/**
 * GET /api/health → { "message": "healthy" }
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
  ],
};
