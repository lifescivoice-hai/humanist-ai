import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Index from "./pages/Index";
import Post from "./pages/Post";
import About from "./pages/About";
import Category from "./pages/Category";
import Blogs from "./pages/Blogs";
import Articles from "./pages/Articles";
import NotFound from "./pages/NotFound";
import Hello from "./pages/Hello";

const queryClient = new QueryClient();

const App = () => (
  <QueryClientProvider client={queryClient}>
    <TooltipProvider>
      <Toaster />
      <Sonner />
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Index />} />
          <Route path="/blogs" element={<Blogs />} />
          <Route path="/articles" element={<Articles />} />
          <Route path="/articles/:slug" element={<Post />} />
          <Route path="/categories/:slug" element={<Category />} />
          <Route path="/about" element={<About />} />
          <Route path="/hello" element={<Hello />} />
          {/* ADD ALL CUSTOM ROUTES ABOVE THE CATCH-ALL "*" ROUTE */}
          <Route path="*" element={<NotFound />} />
        </Routes>
      </BrowserRouter>
    </TooltipProvider>
  </QueryClientProvider>
);

export default App;
