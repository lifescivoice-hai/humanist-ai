import { Link } from "react-router-dom";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Badge } from "@/components/ui/badge";
import { Skeleton } from "@/components/ui/skeleton";
import { useArticles } from "@/hooks/useArticles";
import { Clock, Calendar, ArrowRight } from "lucide-react";
import blog1 from "@/assets/blog-1.jpg";
import blog2 from "@/assets/blog-2.jpg";
import blog3 from "@/assets/blog-3.jpg";

const FALLBACK_IMAGES = [blog1, blog2, blog3];

const Blogs = () => {
  const { data, isLoading, isError, error } = useArticles(1, 100);
  const blogs = data?.articles || [];

  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      <main className="flex-1">
        <section className="py-12 md:py-16 bg-background">
          <div className="section-container">
            <div className="mb-10">
              <div className="inline-block px-3 py-1 bg-crimson text-white text-xs font-medium uppercase tracking-wider rounded mb-3">
                All Posts
              </div>
              <h1 className="font-display text-3xl md:text-4xl font-bold text-foreground">
                Latest Blogs
              </h1>
              <p className="text-muted-foreground mt-2">
                Fresh perspectives for the algorithmic age
              </p>
            </div>

            {isLoading ? (
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                {[1, 2, 3, 4, 5, 6].map((k) => (
                  <Skeleton key={k} className="h-80 rounded-xl" />
                ))}
              </div>
            ) : isError ? (
              <p className="text-muted-foreground text-center py-12">
                {error instanceof Error ? error.message : "Failed to load blogs."}
              </p>
            ) : blogs.length === 0 ? (
              <p className="text-muted-foreground text-center py-12">
                No blogs available yet.
              </p>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                {blogs.map((blog, index) => (
                  <Link
                    key={blog.id}
                    to={`/articles/${blog.slug}`}
                    className="group block overflow-hidden rounded-xl bg-card shadow-card hover:shadow-hover transition-all duration-300"
                  >
                    <div className="relative overflow-hidden aspect-video">
                      <img
                        src={blog.featuredImage || FALLBACK_IMAGES[index % FALLBACK_IMAGES.length]}
                        alt={blog.title}
                        className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                      />
                      <Badge className="absolute top-4 left-4 bg-crimson text-accent-foreground border-none">
                        {blog.category}
                      </Badge>
                    </div>
                    <div className="p-5">
                      <h2 className="font-display font-semibold text-lg text-foreground group-hover:text-crimson transition-colors line-clamp-2">
                        {blog.title}
                      </h2>
                      <p className="text-muted-foreground text-sm mt-2 line-clamp-2">
                        {blog.excerpt}
                      </p>
                      <div className="flex items-center justify-between mt-4 text-xs text-muted-foreground">
                        <div className="flex items-center gap-3">
                          <span className="flex items-center gap-1">
                            <Clock className="w-3 h-3" />
                            {blog.readTime}
                          </span>
                          <span className="flex items-center gap-1">
                            <Calendar className="w-3 h-3" />
                            {blog.date}
                          </span>
                        </div>
                        <ArrowRight className="w-4 h-4 text-crimson opacity-0 group-hover:opacity-100 transition-opacity" />
                      </div>
                    </div>
                  </Link>
                ))}
              </div>
            )}
          </div>
        </section>
      </main>
      <Footer />
    </div>
  );
};

export default Blogs;

