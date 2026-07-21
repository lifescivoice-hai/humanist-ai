import { writeFileSync, mkdirSync } from 'fs';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';
import { buildSitemapXml } from './sitemap.mjs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const outPath = join(__dirname, '..', 'public', 'sitemap.xml');

const xml = await buildSitemapXml();
mkdirSync(dirname(outPath), { recursive: true });
writeFileSync(outPath, xml, 'utf8');

const urlCount = (xml.match(/<url>/g) || []).length;
console.log(`Wrote ${outPath} (${urlCount} URLs)`);
