import express from 'express';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import { existsSync } from 'fs';
import { buildSitemapXml } from './scripts/sitemap.mjs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const app = express();
const PORT = process.env.PORT || 3000;

// Serve static files from the dist directory
const distPath = join(__dirname, 'dist');

// Check if dist directory exists
if (!existsSync(distPath)) {
  console.error('ERROR: dist directory not found!');
  console.error('Please run "npm run build" first to create the production build.');
  process.exit(1);
}

// Live sitemap from Strapi (articles + categories). Falls back to static file if fetch fails.
app.get('/sitemap.xml', async (_req, res) => {
  try {
    const xml = await buildSitemapXml({
      siteUrl: process.env.SITE_URL || 'https://thehumanistai.com',
      strapiUrl:
        process.env.STRAPI_URL ||
        process.env.VITE_STRAPI_URL ||
        'https://api.thehumanistai.com',
    });
    res
      .type('application/xml')
      .set('Cache-Control', 'public, max-age=3600')
      .send(xml);
  } catch (err) {
    console.error('Sitemap generation failed:', err);
    const fallback = join(distPath, 'sitemap.xml');
    if (existsSync(fallback)) {
      res.type('application/xml').sendFile(fallback);
      return;
    }
    res.status(500).type('text/plain').send('Sitemap unavailable');
  }
});

// Serve static files (CSS, JS, images, etc.)
app.use(express.static(distPath, {
  maxAge: '1y', // Cache static assets for 1 year
  etag: true,
}));

// Handle React Router - serve index.html for all routes
// This ensures client-side routing works correctly
app.use((req, res) => {
  const indexPath = join(distPath, 'index.html');

  if (!existsSync(indexPath)) {
    res.status(404).send('index.html not found. Please build the application first.');
    return;
  }

  res.sendFile(indexPath);
});


// Start the server
app.listen(PORT, () => {
  console.log(`🚀 Server is running on port ${PORT}`);
  console.log(`📁 Serving files from: ${distPath}`);
  console.log(`🌐 Application URL: http://localhost:${PORT}`);
});

// Handle errors
app.on('error', (err) => {
  console.error('Server error:', err);
});
