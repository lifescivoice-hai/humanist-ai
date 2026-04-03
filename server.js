import express from 'express';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import { existsSync } from 'fs';

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
