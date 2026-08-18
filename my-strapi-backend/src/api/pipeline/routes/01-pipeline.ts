/**
 * Authenticated pipeline control API (Bearer token required).
 * Mounted under /api/pipeline/*
 */

export default {
  type: 'content-api' as const,
  routes: [
    {
      method: 'GET',
      path: '/pipeline/config',
      handler: 'api::pipeline.pipeline.getConfig',
      config: { auth: false, policies: ['global::pipeline-auth'] },
    },
    {
      method: 'PUT',
      path: '/pipeline/config',
      handler: 'api::pipeline.pipeline.updateConfig',
      config: { auth: false, policies: ['global::pipeline-auth'] },
    },
    {
      method: 'GET',
      path: '/pipeline/runs',
      handler: 'api::pipeline.pipeline.getRuns',
      config: { auth: false, policies: ['global::pipeline-auth'] },
    },
    {
      method: 'POST',
      path: '/pipeline/run-now',
      handler: 'api::pipeline.pipeline.runNow',
      config: { auth: false, policies: ['global::pipeline-auth'] },
    },
    {
      method: 'GET',
      path: '/pipeline/queue',
      handler: 'api::pipeline.pipeline.getQueue',
      config: { auth: false, policies: ['global::pipeline-auth'] },
    },
    {
      method: 'POST',
      path: '/pipeline/articles/:id/approve',
      handler: 'api::pipeline.pipeline.approveArticle',
      config: { auth: false, policies: ['global::pipeline-auth'] },
    },
    {
      method: 'POST',
      path: '/pipeline/articles/:id/reject',
      handler: 'api::pipeline.pipeline.rejectArticle',
      config: { auth: false, policies: ['global::pipeline-auth'] },
    },
  ],
};
