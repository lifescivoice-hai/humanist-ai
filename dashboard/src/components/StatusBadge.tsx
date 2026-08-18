import type { RunStatus } from '../types';

const styles: Record<RunStatus, string> = {
  running: 'bg-blue-50 text-blue-700',
  success: 'bg-emerald-50 text-emerald-700',
  partial: 'bg-amber-50 text-amber-800',
  failed: 'bg-red-50 text-red-700',
};

export function StatusBadge({ status }: { status?: RunStatus | null }) {
  if (!status) return <span className="text-slate-400 text-sm">—</span>;
  return (
    <span className={`inline-flex rounded-full px-2.5 py-0.5 text-xs font-semibold capitalize ${styles[status]}`}>
      {status}
    </span>
  );
}

export function formatWhen(value?: string | null) {
  if (!value) return '—';
  const d = new Date(value);
  if (Number.isNaN(d.getTime())) return value;
  return d.toLocaleString();
}
