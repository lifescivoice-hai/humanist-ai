import type { Core } from '@strapi/strapi';
import type { PipelineLog, RunStatus } from './types';

export class RunLogger {
  logs: PipelineLog[] = [];

  constructor(
    private strapi: Core.Strapi,
    private documentId: string
  ) {}

  async log(step: string, level: PipelineLog['level'], message: string) {
    this.logs.push({
      step,
      level,
      message,
      timestamp: new Date().toISOString(),
    });

    const prefix = `[pipeline:${step}]`;
    if (level === 'error') this.strapi.log.error(`${prefix} ${message}`);
    else if (level === 'warn') this.strapi.log.warn(`${prefix} ${message}`);
    else this.strapi.log.info(`${prefix} ${message}`);

    await this.flush();
  }

  async flush(extra: {
    articlesCreated?: number;
    runStatus?: RunStatus;
    finishedAt?: string;
    error?: string | null;
    failureReason?: string | null;
  } = {}) {
    await this.strapi.documents('api::pipeline-run.pipeline-run').update({
      documentId: this.documentId,
      data: {
        logs: JSON.parse(JSON.stringify(this.logs)),
        ...(extra.articlesCreated !== undefined ? { articlesCreated: extra.articlesCreated } : {}),
        ...(extra.runStatus ? { runStatus: extra.runStatus } : {}),
        ...(extra.finishedAt ? { finishedAt: extra.finishedAt } : {}),
        ...(extra.error !== undefined ? { error: extra.error } : {}),
        ...(extra.failureReason !== undefined ? { failureReason: extra.failureReason } : {}),
      },
    });
  }
}
