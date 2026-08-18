import { useEffect, useState } from 'react';
import type { FormEvent } from 'react';
import { clearSession, fetchConfig, getApiUrl, getToken, setApiUrl, setToken } from './api';
import type { PipelineConfig } from './types';
import { Overview } from './views/Overview';
import { Queue } from './views/Queue';
import { RunHistory } from './views/RunHistory';
import { Settings } from './views/Settings';

type View = 'overview' | 'settings' | 'runs' | 'queue';

const NAV: Array<{ id: View; label: string }> = [
  { id: 'overview', label: 'Overview' },
  { id: 'settings', label: 'Settings' },
  { id: 'runs', label: 'Run history' },
  { id: 'queue', label: 'Moderation' },
];

export default function App() {
  const [token, setTokenState] = useState(getToken());
  const [apiUrl, setApiUrlState] = useState(getApiUrl());
  const [connected, setConnected] = useState(false);
  const [config, setConfig] = useState<PipelineConfig | null>(null);
  const [view, setView] = useState<View>('overview');
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  const connect = async (event?: FormEvent) => {
    event?.preventDefault();
    setToken(token);
    setApiUrl(apiUrl);
    setLoading(true);
    setError(null);
    try {
      const data = await fetchConfig();
      setConfig(data);
      setConnected(true);
    } catch (err) {
      setConnected(false);
      setError(err instanceof Error ? err.message : 'Could not reach the pipeline API');
    } finally {
      setLoading(false);
    }
  };

  const refresh = async () => {
    const data = await fetchConfig();
    setConfig(data);
  };

  useEffect(() => {
    if (getToken()) void connect();
  }, []);

  if (!connected || !config) {
    return (
      <div className="min-h-screen grid place-items-center p-6">
        <form onSubmit={(e) => void connect(e)} className="card w-full max-w-md space-y-4">
          <div>
            <p className="text-xs font-semibold uppercase tracking-wider text-crimson">The Humanist AI</p>
            <h1 className="text-2xl font-semibold mt-1">News pipeline</h1>
            <p className="text-sm text-slate-500 mt-1">Sign in with the dashboard bearer token.</p>
          </div>
          <label className="field">
            <span className="label">Strapi URL</span>
            <input className="input" value={apiUrl} onChange={(e) => setApiUrlState(e.target.value)} />
          </label>
          <label className="field">
            <span className="label">Bearer token</span>
            <input
              className="input"
              type="password"
              value={token}
              onChange={(e) => setTokenState(e.target.value)}
              autoComplete="off"
            />
          </label>
          {error && <p className="text-sm text-crimson">{error}</p>}
          <button type="submit" className="btn-primary w-full" disabled={loading || !token}>
            {loading ? 'Connecting…' : 'Connect'}
          </button>
        </form>
      </div>
    );
  }

  const showQueue = config.publishMode !== 'publish';

  return (
    <div className="min-h-screen">
      <header className="bg-navy text-white">
        <div className="mx-auto flex max-w-6xl flex-wrap items-center justify-between gap-4 px-6 py-4">
          <div>
            <p className="text-xs uppercase tracking-wider text-white/60">The Humanist AI</p>
            <h1 className="text-lg font-semibold">News pipeline</h1>
          </div>
          <button
            type="button"
            className="text-sm text-white/80 hover:text-white"
            onClick={() => {
              clearSession();
              setConnected(false);
              setConfig(null);
            }}
          >
            Disconnect
          </button>
        </div>
        <nav className="mx-auto flex max-w-6xl gap-1 px-6 pb-3">
          {NAV.filter((item) => item.id !== 'queue' || showQueue).map((item) => (
            <button
              key={item.id}
              type="button"
              onClick={() => setView(item.id)}
              className={`rounded-lg px-3 py-1.5 text-sm ${
                view === item.id ? 'bg-white text-navy' : 'text-white/80 hover:bg-white/10'
              }`}
            >
              {item.label}
            </button>
          ))}
        </nav>
      </header>

      <main className="mx-auto max-w-6xl px-6 py-8">
        {view === 'overview' && <Overview config={config} />}
        {view === 'settings' && (
          <Settings
            config={config}
            onSaved={(next) => setConfig((prev) => ({ ...prev, ...next }))}
          />
        )}
        {view === 'runs' && <RunHistory onRan={() => void refresh()} />}
        {view === 'queue' && showQueue && <Queue publishMode={config.publishMode} />}
      </main>
    </div>
  );
}
