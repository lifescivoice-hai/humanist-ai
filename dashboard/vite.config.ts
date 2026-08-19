import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig(({ command }) => ({
  plugins: [react()],
  base: command === 'build' ? '/pipeline/' : '/',
  server: {
    // 5173 is taken by Strapi admin Vite (returns 426 Upgrade Required).
    port: 5174,
    strictPort: true,
  },
}));
