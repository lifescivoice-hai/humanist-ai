import { useEffect, useState } from 'react';
import type { FormEvent } from 'react';
import { saveConfig } from '../api';
import type { PipelineConfig, PublishMode } from '../types';

const TIMEZONES = [
  'UTC',
  'America/New_York',
  'America/Chicago',
  'America/Denver',
  'America/Los_Angeles',
  'America/Toronto',
  'America/Sao_Paulo',
  'Europe/London',
  'Europe/Paris',
  'Europe/Berlin',
  'Asia/Karachi',
  'Asia/Dubai',
  'Asia/Kolkata',
  'Asia/Singapore',
  'Asia/Tokyo',
  'Australia/Sydney',
  'Africa/Lagos',
];

const stringify = (value: unknown) => {
  if (value == null || value === '') return '';
  if (typeof value === 'string') return value;
  try {
    return JSON.stringify(value, null, 2);
  } catch {
    return String(value);
  }
};

const websitesToText = (value: unknown) => {
  if (Array.isArray(value)) return value.map(String).join('\n');
  if (typeof value === 'string') return value;
  return '';
};

const textToWebsites = (raw: string) =>
  raw
    .split(/[\n,]+/)
    .map((line) => line.trim())
    .filter(Boolean);

const parseJsonField = (raw: string, label: string) => {
  const trimmed = raw.trim();
  if (!trimmed) return null;
  try {
    return JSON.parse(trimmed);
  } catch {
    throw new Error(`${label} must be valid JSON`);
  }
};

export function Settings({
  config,
  onSaved,
}: {
  config: PipelineConfig;
  onSaved: (next: PipelineConfig) => void;
}) {
  const [enabled, setEnabled] = useState(Boolean(config.enabled));
  const [articlesPerDay, setArticlesPerDay] = useState(String(config.articlesPerDay ?? 3));
  const [runTime, setRunTime] = useState(config.runTime || '07:00');
  const [timezone, setTimezone] = useState(config.timezone || 'America/New_York');
  const [publishMode, setPublishMode] = useState<PublishMode>(config.publishMode || 'draft');
  const [newsSources, setNewsSources] = useState(stringify(config.newsSources));
  const [newsWebsites, setNewsWebsites] = useState(websitesToText(config.newsWebsites));
  const [categories, setCategories] = useState(stringify(config.categories));
  const [rewritePrompt, setRewritePrompt] = useState(config.rewritePrompt || '');
  const [imageStylePrompt, setImageStylePrompt] = useState(config.imageStylePrompt || '');
  const [geminiMockMode, setGeminiMockMode] = useState(Boolean(config.geminiMockMode));
  const [saving, setSaving] = useState(false);
  const [message, setMessage] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    setEnabled(Boolean(config.enabled));
    setArticlesPerDay(String(config.articlesPerDay ?? 3));
    setRunTime(config.runTime || '07:00');
    setTimezone(config.timezone || 'America/New_York');
    setPublishMode(config.publishMode || 'draft');
    setNewsSources(stringify(config.newsSources));
    setNewsWebsites(websitesToText(config.newsWebsites));
    setCategories(stringify(config.categories));
    setRewritePrompt(config.rewritePrompt || '');
    setImageStylePrompt(config.imageStylePrompt || '');
    setGeminiMockMode(Boolean(config.geminiMockMode));
  }, [config]);

  const onSubmit = async (event: FormEvent) => {
    event.preventDefault();
    setSaving(true);
    setError(null);
    setMessage(null);
    try {
      const body: Partial<PipelineConfig> = {
        enabled,
        articlesPerDay: Number(articlesPerDay),
        runTime,
        timezone,
        publishMode,
        newsSources: parseJsonField(newsSources, 'News sources'),
        newsWebsites: textToWebsites(newsWebsites),
        categories: parseJsonField(categories, 'Categories'),
        rewritePrompt,
        imageStylePrompt,
        geminiMockMode,
      };
      const next = await saveConfig(body);
      onSaved(next);
      setMessage('Saved. Schedule updated without a restart.');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Save failed');
    } finally {
      setSaving(false);
    }
  };

  return (
    <form onSubmit={onSubmit} className="space-y-6 max-w-3xl">
      <div className="card flex items-center justify-between gap-4">
        <div>
          <p className="font-semibold">Master enable</p>
          <p className="text-sm text-slate-500">When off, the daily cron does not fire.</p>
        </div>
        <button
          type="button"
          onClick={() => setEnabled((v) => !v)}
          className={`relative h-7 w-12 rounded-full transition ${enabled ? 'bg-crimson' : 'bg-slate-300'}`}
          aria-pressed={enabled}
        >
          <span
            className={`absolute top-0.5 h-6 w-6 rounded-full bg-white shadow transition ${enabled ? 'left-5' : 'left-0.5'}`}
          />
        </button>
      </div>

      <div className="card flex items-center justify-between gap-4">
        <div>
          <p className="font-semibold">Gemini mock mode</p>
          <p className="text-sm text-slate-500">
            When on, classify+rewrite is canned locally so tests do not burn Gemini quota. Images still generate.
            Turn off before a real run.
          </p>
        </div>
        <button
          type="button"
          onClick={() => setGeminiMockMode((v) => !v)}
          className={`relative h-7 w-12 rounded-full transition ${geminiMockMode ? 'bg-amber-500' : 'bg-slate-300'}`}
          aria-pressed={geminiMockMode}
        >
          <span
            className={`absolute top-0.5 h-6 w-6 rounded-full bg-white shadow transition ${geminiMockMode ? 'left-5' : 'left-0.5'}`}
          />
        </button>
      </div>

      <div className="card grid gap-4 sm:grid-cols-2">
        <label className="field">
          <span className="label">Articles per day</span>
          <input className="input" type="number" min={1} value={articlesPerDay} onChange={(e) => setArticlesPerDay(e.target.value)} />
        </label>
        <label className="field">
          <span className="label">Run time</span>
          <input className="input" type="time" value={runTime} onChange={(e) => setRunTime(e.target.value)} />
        </label>
        <label className="field">
          <span className="label">Timezone (IANA)</span>
          <input className="input" list="tz" value={timezone} onChange={(e) => setTimezone(e.target.value)} />
          <datalist id="tz">
            {TIMEZONES.map((tz) => (
              <option key={tz} value={tz} />
            ))}
          </datalist>
        </label>
        <label className="field">
          <span className="label">Publish mode</span>
          <select className="input" value={publishMode} onChange={(e) => setPublishMode(e.target.value as PublishMode)}>
            <option value="draft">draft</option>
            <option value="publish">publish</option>
          </select>
        </label>
      </div>

      <div className="card space-y-4">
        <label className="field">
          <span className="label">Websites (one domain per line)</span>
          <textarea
            className="input min-h-28 font-mono text-xs"
            value={newsWebsites}
            onChange={(e) => setNewsWebsites(e.target.value)}
            placeholder={'techcrunch.com\ntheverge.com\nwired.com'}
          />
          <span className="text-xs text-slate-500">
            Leave empty to use NewsAPI. If filled, the pipeline reads each site&apos;s RSS feed
            (Google News is used when a site blocks RSS).
          </span>
        </label>
        <label className="field">
          <span className="label">News sources (JSON)</span>
          <textarea className="input min-h-32 font-mono text-xs" value={newsSources} onChange={(e) => setNewsSources(e.target.value)} />
          <span className="text-xs text-slate-500">Example: {`{"q":"artificial intelligence","language":"en","pageSize":20}`}</span>
        </label>
        <label className="field">
          <span className="label">Categories (JSON array)</span>
          <textarea className="input min-h-24 font-mono text-xs" value={categories} onChange={(e) => setCategories(e.target.value)} />
        </label>
        <label className="field">
          <span className="label">Rewrite prompt</span>
          <textarea className="input min-h-32" value={rewritePrompt} onChange={(e) => setRewritePrompt(e.target.value)} />
        </label>
        <label className="field">
          <span className="label">Image style prompt</span>
          <textarea className="input min-h-24" value={imageStylePrompt} onChange={(e) => setImageStylePrompt(e.target.value)} />
        </label>
      </div>

      {error && <p className="text-sm text-crimson">{error}</p>}
      {message && <p className="text-sm text-emerald-700">{message}</p>}

      <button type="submit" className="btn-primary" disabled={saving}>
        {saving ? 'Saving…' : 'Save settings'}
      </button>
    </form>
  );
}
