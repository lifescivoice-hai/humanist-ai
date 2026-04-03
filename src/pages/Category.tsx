import { Link, useParams } from "react-router-dom";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Badge } from "@/components/ui/badge";
import { Skeleton } from "@/components/ui/skeleton";
import { Button } from "@/components/ui/button";
import { useCategoryPage } from "@/hooks/useArticles";
import { Clock, Calendar, User, ArrowRight, ChevronLeft } from "lucide-react";
import blog1 from "@/assets/blog-1.jpg";
import blog2 from "@/assets/blog-2.jpg";
import blog3 from "@/assets/blog-3.jpg";

const FALLBACK_IMAGES = [blog1, blog2, blog3];

const Category = () => {
  const { slug } = useParams<{ slug: string }>();
  const { data, isLoading, isError, error } = useCategoryPage(slug, 1, 24);

  if (isLoading) {
    return (
      <div className="min-h-screen flex flex-col">
        <Header />
        <main className="flex-1">
          <div className="section-container py-10 md:py-14">
            <Skeleton className="h-10 w-64 mb-4" />
            <Skeleton className="h-6 w-full max-w-xl mb-10" />
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              {[1, 2, 3, 4].map((k) => (
                <Skeleton key={k} className="h-52 rounded-xl" />
              ))}
            </div>
          </div>
        </main>
        <Footer />
      </div>
    );
  }

  if (isError) {
    return (
      <div className="min-h-screen flex flex-col">
        <Header />
        <main className="flex-1">
          <div className="section-container py-10 md:py-14 text-center">
            <h1 className="font-display text-2xl font-bold text-foreground mb-4">Something went wrong</h1>
            <p className="text-muted-foreground mb-6">
              {error instanceof Error ? error.message : "Could not load this category."}
            </p>
            <Button variant="accent" asChild>
              <Link to="/">Back to Home</Link>
            </Button>
          </div>
        </main>
        <Footer />
      </div>
    );
  }

  const { category, articles } = data ?? { category: null, articles: [] };

  if (!category) {
    return (
      <div className="min-h-screen flex flex-col">
        <Header />
        <main className="flex-1">
          <div className="section-container py-10 md:py-14 text-center">
            <h1 className="font-display text-2xl font-bold text-foreground mb-4">Category not found</h1>
            <p className="text-muted-foreground mb-6">
              There is no category with slug{" "}
              <code className="bg-muted px-2 py-1 rounded text-sm">{slug}</code>.
            </p>
            <Button variant="accent" asChild>
              <Link to="/">Back to Home</Link>
            </Button>
          </div>
        </main>
        <Footer />
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col">
      <Header />

      <main className="flex-1">
        <div className="bg-navy text-primary-foreground">
          <div className="section-container py-10 md:py-12">
            <Link
              to="/"
              className="inline-flex items-center gap-2 text-sm text-primary-foreground/80 hover:text-white mb-6 transition-colors"
            >
              <ChevronLeft className="w-4 h-4" />
              Back to Home
            </Link>
            <Badge className="bg-crimson text-white border-none mb-4">Category</Badge>
            <h1 className="font-display text-3xl md:text-4xl lg:text-5xl font-bold mb-3">{category.name}</h1>
            {category.description ? (
              <p className="text-primary-foreground/80 max-w-3xl text-lg leading-relaxed">{category.description}</p>
            ) : (
              <p className="text-primary-foreground/70 max-w-3xl">
                Articles tagged with this category from The Humanist AI.
              </p>
            )}
          </div>
        </div>

        <div className="section-container py-10 md:py-14">
          {articles.length === 0 ? (
            <p className="text-muted-foreground text-center py-12">
              No published articles in this category yet.
            </p>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              {articles.map((article, index) => (
                <Link
                  key={article.id}
                  to={`/articles/${article.slug}`}
                  className="group flex flex-col sm:flex-row gap-4 p-4 rounded-xl bg-card border border-border hover:border-crimson/30 hover:shadow-hover transition-all overflow-hidden"
                >
                  <div className="sm:w-44 shrink-0 aspect-video sm:aspect-[4/3] rounded-lg overflow-hidden bg-muted">
                    <img
                      src={article.featuredImage || FALLBACK_IMAGES[index % FALLBACK_IMAGES.length]}
                      alt=""
                      className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                    />
                  </div>
                  <div className="min-w-0 flex-1 flex flex-col">
                    <div className="flex items-center gap-2 mb-2 flex-wrap">
                      <Badge variant="outline" className="text-crimson border-crimson/30 text-xs">
                        {article.category}
                      </Badge>
                      <span className="text-xs text-muted-foreground">{article.date}</span>
                    </div>
                    <h2 className="font-display text-lg font-semibold text-foreground group-hover:text-crimson transition-colors line-clamp-2 mb-2">
                      {article.title}
                    </h2>
                    <p className="text-muted-foreground text-sm line-clamp-2 mb-3 flex-1">{article.excerpt}</p>
                    <div className="flex items-center justify-between gap-4 mt-auto">
                      <div className="flex items-center gap-3 text-xs text-muted-foreground">
                        <span className="flex items-center gap-1">
                          <User className="w-3 h-3 shrink-0" />
                          <span className="truncate">{article.author}</span>
                        </span>
                        <span className="flex items-center gap-1">
                          <Clock className="w-3 h-3 shrink-0" />
                          {article.readTime}
                        </span>
                        <span className="hidden sm:flex items-center gap-1">
                          <Calendar className="w-3 h-3 shrink-0" />
                          {article.date}
                        </span>
                      </div>
                      <ArrowRight className="w-4 h-4 text-crimson shrink-0 opacity-0 group-hover:opacity-100 transition-opacity" />
                    </div>
                  </div>
                </Link>
              ))}
            </div>
          )}
        </div>
      </main>

      <Footer />
    </div>
  );
};

export default Category;
