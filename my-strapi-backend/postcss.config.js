/**
 * Strapi admin build must not use the repo-root PostCSS (Tailwind for the Vite app).
 * Without this file, PostCSS resolves ../postcss.config.js on Render and fails: Cannot find module 'tailwindcss'.
 */
module.exports = {
  plugins: {},
};
