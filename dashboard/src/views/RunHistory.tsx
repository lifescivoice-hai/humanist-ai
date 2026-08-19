import { Fragment, useCallback, useEffect, useState } from 'react';
import { fetchRuns, runNow } from '../api';
import { StatusBadge, formatWhen } from '../components/StatusBadge';
import type { PipelineRun } from '../types';

export function RunHistory({ onRan }: { onRan: () => void }) {
  const [rows, setRows] = useState<PipelineRun[]>([]);
  const [page, setPage] = useState(1);
  const [pageCount, setPageCount] = useState(1);
  const [openId, setOpenId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [running, setRunning] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [notice, setNotice] = useState<string | null>(null);

  const load = useCallback(async (nextPage = page) => {
    setLoading(true);
    setError(null);
    try {
      const result = await fetchRuns(nextPage, 20);
      setRows(result.data || []);
      setPageCount(result.meta?.pagination?.pageCount || 1);
      setPage(result.meta?.pagination?.page || nextPage);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load runs');
    } finally {
      setLoading(false);
    }
  }, [page]);

  useEffect(() => {
    void load(page);
  }, [load, page]);

  const onRunNow = async () => {
    if (!confirm('Start a pipeline run now? This can take several minutes.')) return;
    setRunning(true);
    setNotice(null);
    setError(null);
    try {
      const result = await runNow();
      setNotice(`Run finished: ${JSON.stringify(result)}`);
      onRan();
      await load(1);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Run failed');
    } finally {
      setRunning(false);
    }
  };

  return (
    <div className="space-y-4">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <p className="text-sm text-slate-500">Newest first. Click a row for step logs.</p>
        <button type="button" className="btn-primary" onClick={() => void onRunNow()} disabled={running}>
          {running ? 'Running…' : 'Run now'}
        </button>
      </div>
      {error && <p className="text-sm text-crimson">{error}</p>}
      {notice && <p className="text-sm text-emerald-700 break-all">{notice}</p>}
      <div className="card overflow-x-auto p-0">
        <table className="w-full text-sm">
          <thead className="bg-slate-50 text-left text-xs uppercase tracking-wide text-slate-500">
            <tr>
              <th className="px-4 py-3">Started</th>
              <th className="px-4 py-3">Status</th>
              <th className="px-4 py-3">Articles</th>
              <th className="px-4 py-3">Finished</th>
            </tr>
          </thead>
          <tbody>
            {loading && (
              <tr>
                <td className="px-4 py-6 text-slate-400" colSpan={4}>
                  Loading…
                </td>
              </tr>
            )}
            {!loading && rows.length === 0 && (
              <tr>
                <td className="px-4 py-6 text-slate-400" colSpan={4}>
                  No runs yet.
                </td>
              </tr>
            )}
            {rows.map((run) => (
              <Fragment key={run.documentId}>
                <tr
                  className="cursor-pointer border-t border-slate-100 hover:bg-slate-50"
                  onClick={() => setOpenId((id) => (id === run.documentId ? null : run.documentId))}
                >
                  <td className="px-4 py-3">{formatWhen(run.startedAt)}</td>
                  <td className="px-4 py-3">
                    <StatusBadge status={run.runStatus} />
                    {run.failureReason && (
                      <p className="mt-1 text-xs text-crimson">{run.failureReason}</p>
                    )}
                  </td>
                  <td className="px-4 py-3">{run.articlesCreated ?? 0}</td>
                  <td className="px-4 py-3">{formatWhen(run.finishedAt)}</td>
                </tr>
                {openId === run.documentId && (
                  <tr className="bg-slate-50">
                    <td colSpan={4} className="px-4 py-3">
                      {run.failureReason && (
                        <p className="mb-2 text-sm font-medium text-crimson">Reason: {run.failureReason}</p>
                      )}
                      {run.error && <p className="mb-2 text-sm text-crimson">{run.error}</p>}
                      <ul className="space-y-1 font-mono text-xs text-slate-600">
                        {(run.logs || []).map((log, i) => (
                          <li key={`${run.documentId}-${i}`}>
                            <span className="text-slate-400">{log.timestamp}</span>{' '}
                            <span className="font-semibold">[{log.step}/{log.level}]</span> {log.message}
                          </li>
                        ))}
                        {!(run.logs || []).length && <li>No logs.</li>}
                      </ul>
                    </td>
                  </tr>
                )}
              </Fragment>
            ))}
          </tbody>
        </table>
      </div>
      <div className="flex items-center gap-3 text-sm">
        <button type="button" className="btn-secondary" disabled={page <= 1} onClick={() => setPage((p) => p - 1)}>
          Previous
        </button>
        <span>
          Page {page} / {pageCount}
        </span>
        <button type="button" className="btn-secondary" disabled={page >= pageCount} onClick={() => setPage((p) => p + 1)}>
          Next
        </button>
      </div>
    </div>
  );
}
