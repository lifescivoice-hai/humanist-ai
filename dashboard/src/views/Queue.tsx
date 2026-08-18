import { useCallback, useEffect, useState } from 'react';
import { approveArticle, fetchQueue, rejectArticle, strapiAdminEditUrl } from '../api';
import type { QueueArticle, QueuePayload } from '../types';

export function Queue({ publishMode }: { publishMode?: string }) {
  const [payload, setPayload] = useState<QueuePayload | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [busyId, setBusyId] = useState<string | null>(null);

  const load = useCallback(async () => {
    setError(null);
    try {
      setPayload(await fetchQueue());
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load queue');
    }
  }, []);

  useEffect(() => {
    void load();
  }, [load]);

  if ((publishMode || payload?.publishMode) === 'publish') {
    return (
      <div className="card text-sm text-slate-500">
        Publish mode is <strong>publish</strong>, so new articles go live immediately. Switch to{' '}
        <strong>draft</strong> in Settings to use the moderation queue.
      </div>
    );
  }

  const onApprove = async (article: QueueArticle) => {
    setBusyId(article.documentId);
    try {
      await approveArticle(article.documentId);
      await load();
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Approve failed');
    } finally {
      setBusyId(null);
    }
  };

  const onReject = async (article: QueueArticle) => {
    if (!confirm(`Delete draft “${article.title || article.documentId}”?`)) return;
    setBusyId(article.documentId);
    try {
      await rejectArticle(article.documentId);
      await load();
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Reject failed');
    } finally {
      setBusyId(null);
    }
  };

  const articles = payload?.articles || [];

  return (
    <div className="space-y-4">
      {error && <p className="text-sm text-crimson">{error}</p>}
      {articles.length === 0 && <div className="card text-sm text-slate-500">No pending drafts.</div>}
      {articles.map((article) => (
        <article key={article.documentId} className="card space-y-3">
          <div>
            <h3 className="font-semibold text-lg">{article.title || 'Untitled'}</h3>
            <p className="text-sm text-slate-500 mt-1">{article.excerpt || 'No excerpt'}</p>
            <p className="text-xs text-slate-400 mt-2">
              {article.author || 'Unknown'} · {article.slug}
            </p>
          </div>
          <div className="flex flex-wrap gap-2">
            <button
              type="button"
              className="btn-primary"
              disabled={busyId === article.documentId}
              onClick={() => void onApprove(article)}
            >
              Approve
            </button>
            <a className="btn-secondary" href={strapiAdminEditUrl(article.documentId)} target="_blank" rel="noreferrer">
              Edit in Strapi
            </a>
            <button
              type="button"
              className="btn-danger"
              disabled={busyId === article.documentId}
              onClick={() => void onReject(article)}
            >
              Reject
            </button>
          </div>
        </article>
      ))}
    </div>
  );
}
