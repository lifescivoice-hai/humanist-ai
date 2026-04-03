import { useParams, Link } from "react-router-dom";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import AdPlaceholder from "@/components/AdPlaceholder";
import { Badge } from "@/components/ui/badge";
import { Skeleton } from "@/components/ui/skeleton";
import { Clock, Calendar, User, ArrowRight } from "lucide-react";
import { useArticleBySlug, useLatestArticles } from "@/hooks/useArticles";

const Post = () => {
  const { slug } = useParams<{ slug: string }>();
  const { data: post, isLoading, error } = useArticleBySlug(slug);
  const { data: latestArticles = [] } = useLatestArticles(5);

  // Debug logging
  if (slug) {
    console.log('Current slug:', slug);
  }

  // Loading state
  if (isLoading) {
    return (
      <div className="min-h-screen flex flex-col">
        <Header />
        <main className="flex-1">
          <div className="section-container py-10 md:py-14">
            <div className="grid grid-cols-1 lg:grid-cols-[1fr_320px] gap-10 lg:gap-12">
              <article>
                <Skeleton className="h-64 w-full mb-8 rounded-xl" />
                <Skeleton className="h-6 w-24 mb-4" />
                <Skeleton className="h-10 w-3/4 mb-4" />
                <Skeleton className="h-6 w-full mb-2" />
                <Skeleton className="h-6 w-full mb-8" />
                <Skeleton className="h-4 w-full mb-2" />
                <Skeleton className="h-4 w-full mb-2" />
                <Skeleton className="h-4 w-3/4 mb-2" />
              </article>
              <aside>
                <Skeleton className="h-64 w-full rounded-xl" />
              </aside>
            </div>
          </div>
        </main>
        <Footer />
      </div>
    );
  }

  // Error state
  if (error || !post) {
    console.error('Post error:', error);
    return (
      <div className="min-h-screen flex flex-col">
        <Header />
        <main className="flex-1">
          <div className="section-container py-10 md:py-14">
            <div className="text-center">
              <h1 className="font-display text-2xl font-bold text-foreground mb-4">
                Article Not Found
              </h1>
              <p className="text-muted-foreground mb-2">
                {error instanceof Error ? error.message : 'The article you are looking for does not exist.'}
              </p>
              {slug && (
                <p className="text-sm text-muted-foreground mb-6">
                  Slug: <code className="bg-muted px-2 py-1 rounded">{slug}</code>
                </p>
              )}
              <Link
                to="/"
                className="inline-flex items-center gap-2 text-crimson hover:underline"
              >
                <ArrowRight className="w-4 h-4 rotate-180" />
                Back to Home
              </Link>
            </div>
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
        {/* Article + Sidebar */}
        <div className="section-container py-10 md:py-14">
          <div className="grid grid-cols-1 lg:grid-cols-[1fr_320px] gap-10 lg:gap-12">
            {/* Main content */}
            <article>
              {/* Contained featured image – card with accent border */}
              {post.featuredImage && (
                <div className="rounded-xl overflow-hidden border border-border shadow-card mb-8 border-l-4 border-l-crimson">
                  <div className="aspect-[16/10] md:aspect-[2/1] bg-muted">
                    <img
                      src={post.featuredImage}
                      alt={post.title}
                      className="w-full h-full object-cover"
                    />
                  </div>
                </div>
              )}

              {/* Title & excerpt */}
              <Badge className="bg-crimson text-accent-foreground border-none mb-4">
                {post.category}
              </Badge>
              <h1 className="font-display text-3xl md:text-4xl font-bold text-foreground mb-3">
                {post.title}
              </h1>
              <p className="text-muted-foreground text-lg mb-6 border-b border-border pb-6">
                {post.excerpt}
              </p>

              {/* Meta row */}
              <div className="flex flex-wrap items-center gap-4 md:gap-6 text-sm text-muted-foreground mb-8">
                <span className="flex items-center gap-2">
                  <User className="w-4 h-4 text-crimson" />
                  {post.author}
                </span>
                <span className="flex items-center gap-2">
                  <Calendar className="w-4 h-4 text-crimson" />
                  {post.date}
                </span>
                <span className="flex items-center gap-2">
                  <Clock className="w-4 h-4 text-crimson" />
                  {post.readTime}
                </span>
              </div>

              {/* Prose content */}
              {post.content && (
                <div
                  className="prose prose-lg max-w-none prose-headings:font-display prose-headings:text-foreground prose-headings:font-semibold prose-p:text-muted-foreground prose-p:leading-relaxed prose-a:text-crimson prose-a:no-underline hover:prose-a:underline prose-strong:text-foreground"
                  dangerouslySetInnerHTML={{ __html: post.content.trim() }}
                />
              )}
            </article>

            {/* Sidebar */}
            <aside className="lg:pt-0 space-y-8">
              {/* Latest Articles */}
              <div className="rounded-xl bg-card border border-border shadow-card p-6">
                <div className="inline-block px-3 py-1 bg-navy text-white text-xs font-medium uppercase tracking-wider rounded mb-4">
                  Latest
                </div>
                <h2 className="font-display text-xl font-semibold text-foreground mb-4">
                  Latest Articles
                </h2>
                <ul className="space-y-4">
                  {latestArticles.map((article) => (
                    <li key={article.id}>
                      <Link
                        to={`/articles/${article.slug}`}
                        className="group flex gap-3 text-foreground hover:text-crimson transition-colors"
                      >
                        <span className="flex-1 text-sm font-medium line-clamp-2 group-hover:text-crimson">
                          {article.title}
                        </span>
                        <ArrowRight className="w-4 h-4 shrink-0 text-crimson opacity-0 group-hover:opacity-100 transition-opacity mt-0.5" />
                      </Link>
                      <p className="text-xs text-muted-foreground mt-1">{article.date}</p>
                    </li>
                  ))}
                </ul>
                <Link
                  to="/articles"
                  className="inline-flex items-center gap-1 text-sm font-medium text-crimson hover:underline mt-4"
                >
                  View all articles
                  <ArrowRight className="w-3.5 h-3.5" />
                </Link>
              </div>

              {/* Advertisement */}
              <div className="flex justify-center">
                <AdPlaceholder size="skyscraper" className="w-full" />
              </div>
            </aside>
          </div>
        </div>

        {/* Inline ad before footer */}
        <div className="py-6 flex justify-center bg-secondary/30">
          <AdPlaceholder size="leaderboard" />
        </div>
      </main>

      <Footer />
    </div>
  );
};

export default Post;
