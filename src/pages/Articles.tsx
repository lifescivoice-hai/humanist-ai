import { Link } from "react-router-dom";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Badge } from "@/components/ui/badge";
import { Skeleton } from "@/components/ui/skeleton";
import { useArticles } from "@/hooks/useArticles";
import { Clock, User, ArrowRight } from "lucide-react";

const Articles = () => {
  const { data, isLoading, isError, error } = useArticles(1, 100);
  const articles = data?.articles || [];

  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      <main className="flex-1">
        <section className="py-12 md:py-16 bg-secondary/30 border-l-4 border-navy">
          <div className="section-container">
            <div className="mb-10">
              <div className="inline-block px-3 py-1 bg-navy text-white text-xs font-medium uppercase tracking-wider rounded mb-3">
                Deep Dives
              </div>
              <h1 className="font-display text-3xl md:text-4xl font-bold text-foreground">
                Featured Articles
              </h1>
              <p className="text-muted-foreground mt-2">
                In-depth analysis and thought leadership
              </p>
            </div>

            {isLoading ? (
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {[1, 2, 3, 4, 5, 6].map((k) => (
                  <Skeleton key={k} className="h-48 rounded-xl" />
                ))}
              </div>
            ) : isError ? (
              <p className="text-muted-foreground text-center py-12">
                {error instanceof Error ? error.message : "Failed to load articles."}
              </p>
            ) : articles.length === 0 ? (
              <p className="text-muted-foreground text-center py-12">
                No articles available yet.
              </p>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                {articles.map((article) => (
                  <Link
                    key={article.id}
                    to={`/articles/${article.slug}`}
                    className="group block p-6 rounded-xl bg-card border border-border hover:border-crimson/30 hover:shadow-hover transition-all duration-300"
                  >
                    <div className="flex items-center gap-3 mb-4">
                      <Badge variant="outline" className="text-crimson border-crimson/30">
                        {article.category}
                      </Badge>
                      <span className="text-xs text-muted-foreground">{article.date}</span>
                    </div>
                    <h2 className="font-display font-semibold text-lg text-foreground group-hover:text-crimson transition-colors mb-3 line-clamp-2">
                      {article.title}
                    </h2>
                    <p className="text-muted-foreground text-sm line-clamp-2 mb-4">
                      {article.excerpt}
                    </p>
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-4 text-xs text-muted-foreground">
                        <span className="flex items-center gap-1">
                          <User className="w-3 h-3" />
                          {article.author}
                        </span>
                        <span className="flex items-center gap-1">
                          <Clock className="w-3 h-3" />
                          {article.readTime}
                        </span>
                      </div>
                      <ArrowRight className="w-4 h-4 text-crimson opacity-0 group-hover:opacity-100 transition-opacity" />
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

export default Articles;

