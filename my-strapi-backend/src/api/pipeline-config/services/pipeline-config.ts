/**
 * pipeline-config service
 */

import { factories } from '@strapi/strapi';
import { runPipeline } from '../../../services/pipeline';

export default factories.createCoreService(
  'api::pipeline-config.pipeline-config',
  ({ strapi }) => ({
    /** Manual test hook — skips the enabled flag. Scheduler (Phase 3) will not use force. */
    runNow() {
      return runPipeline(strapi, { force: true });
    },
  })
);
