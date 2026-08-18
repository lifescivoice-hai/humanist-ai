import type { Core } from '@strapi/strapi';
import { applySchedule } from './services/pipeline/scheduler';
import { runPipeline } from './services/pipeline';

export default {
  register(/* { strapi }: { strapi: Core.Strapi } */) {},

  async bootstrap({ strapi }: { strapi: Core.Strapi }) {
    const uploadStore = strapi.store({ type: 'plugin', name: 'upload' });
    const uploadSettings = ((await uploadStore.get({ key: 'settings' })) || {}) as Record<string, unknown>;
    await uploadStore.set({
      key: 'settings',
      value: {
        ...uploadSettings,
        sizeOptimization: true,
        responsiveDimensions: false,
      },
    });

    await applySchedule(strapi);

    strapi.db.lifecycles.subscribe({
      models: ['api::pipeline-config.pipeline-config'],
      async afterCreate() {
        await applySchedule(strapi);
      },
      async afterUpdate() {
        await applySchedule(strapi);
      },
      async afterDelete() {
        await applySchedule(strapi);
      },
    });

    if (process.env.PIPELINE_RUN_NOW !== 'true') return;

    strapi.log.info('[pipeline] PIPELINE_RUN_NOW=true — queuing a one-shot run');
    setTimeout(() => {
      runPipeline(strapi, { force: true }).catch((err) => {
        strapi.log.error(`[pipeline] one-shot run failed: ${err instanceof Error ? err.message : err}`);
      });
    }, 2500);
  },
};
