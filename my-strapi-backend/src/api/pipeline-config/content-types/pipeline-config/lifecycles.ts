import type { Core } from '@strapi/strapi';
import { applySchedule } from '../../../../services/pipeline/scheduler';

declare const strapi: Core.Strapi;

export default {
  async afterCreate() {
    await applySchedule(strapi);
  },
  async afterUpdate() {
    await applySchedule(strapi);
  },
  async afterDelete() {
    await applySchedule(strapi);
  },
};
