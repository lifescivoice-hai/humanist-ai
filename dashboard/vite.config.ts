import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    // 5173 is taken by Strapi admin Vite (returns 426 Upgrade Required).
    port: 5174,
    strictPort: true,
  },
});
