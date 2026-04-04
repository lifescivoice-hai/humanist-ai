import { defineConfig, type Plugin } from "vite";
import react from "@vitejs/plugin-react-swc";
import path from "path";
import { componentTagger } from "lovable-tagger";

const HEALTH_JSON = JSON.stringify({ message: "healthy" });

/** GET /health → same JSON as Strapi (avoids /api proxy). */
function frontendHealthRoute(): Plugin {
  const serve = (
    req: { method?: string; url?: string },
    res: { setHeader: (k: string, v: string) => void; end: (b: string) => void }
  ) => {
    if (req.method !== "GET") return false;
    const pathname = req.url?.split("?")[0];
    if (pathname !== "/health") return false;
    res.setHeader("Content-Type", "application/json");
    res.end(HEALTH_JSON);
    return true;
  };
  return {
    name: "frontend-health",
    enforce: "pre",
    configureServer(server) {
      server.middlewares.use((req, res, next) => {
        if (serve(req, res)) return;
        next();
      });
    },
    configurePreviewServer(server) {
      server.middlewares.use((req, res, next) => {
        if (serve(req, res)) return;
        next();
      });
    },
  };
}

// https://vitejs.dev/config/
export default defineConfig(({ mode }) => ({
  server: {
    host: "::",
    port: 8080,
    hmr: {
      overlay: false,
    },
    // Optional: only if requests go to /api on dev server (app uses VITE_STRAPI_URL for absolute URLs)
    proxy: {
      '/api': {
        target: 'https://api.thehumanistai.com',
        changeOrigin: true,
        secure: true,
      },
    },
  },
  plugins: [frontendHealthRoute(), react(), mode === "development" && componentTagger()].filter(Boolean),
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
}));
