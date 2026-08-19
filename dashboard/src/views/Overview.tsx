import type { PipelineConfig } from '../types';
import { StatusBadge, formatWhen } from '../components/StatusBadge';

export function Overview({ config }: { config: PipelineConfig }) {
  const last = config.lastRun;
  return (
    <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
      <div className="card">
        <p className="label">Pipeline</p>
        <p className="mt-2 text-2xl font-semibold">
          {config.enabled ? 'Enabled' : 'Disabled'}
        </p>
        <p className="mt-1 text-sm text-slate-500">Master switch from Settings</p>
      </div>
      <div className="card">
        <p className="label">Next run</p>
        <p className="mt-2 text-lg font-semibold">{formatWhen(config.nextRunAt)}</p>
        <p className="mt-1 text-sm text-slate-500">
          {config.runTime || '07:00'} · {config.timezone || 'America/New_York'}
        </p>
      </div>
      <div className="card">
        <p className="label">Last run</p>
        <div className="mt-2">
          <StatusBadge status={last?.runStatus} />
        </div>
        {last?.failureReason && (
          <p className="mt-1 text-sm text-crimson">{last.failureReason}</p>
        )}
        <p className="mt-2 text-sm text-slate-500">{formatWhen(last?.startedAt)}</p>
      </div>
      <div className="card">
        <p className="label">Articles</p>
        <p className="mt-2 text-2xl font-semibold">{last?.articlesCreated ?? 0}</p>
        <p className="mt-1 text-sm text-slate-500">
          Cap {config.articlesPerDay ?? 3}/day · mode {config.publishMode || 'draft'}
        </p>
      </div>
    </div>
  );
}
