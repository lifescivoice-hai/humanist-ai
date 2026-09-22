import { Clock, User, ArrowRight, Newspaper } from "lucide-react";
import { Link } from "react-router-dom";
import { useHomepageSections } from "@/hooks/useArticles";
import { Skeleton } from "@/components/ui/skeleton";
import SectionHeader from "@/components/SectionHeader";

const ImageFallback = ({ className }: { className?: string }) => (
  <div
    className={`flex items-center justify-center bg-muted text-muted-foreground ${className ?? ""}`}
    aria-hidden
  >
    <Newspaper className="w-6 h-6 opacity-60" />
  </div>
);

const FeaturedArticles = () => {
  const { featured: items, isLoading } = useHomepageSections();
  const articles = items.slice(0, 5);
  const [lead, ...rest] = articles;

  return (
    <section className="py-16 md:py-20 bg-secondary/40">
      <div className="section-container">
        <SectionHeader
          kicker="Analysis"
          title="Featured"
          description="Longer reads and arguments — not a second copy of the latest headlines."
          action={
            <Link to="/articles" className="hidden md:inline-flex items-center gap-1 text-sm font-medium hover:text-crimson">
              All essays
              <ArrowRight className="w-4 h-4" />
            </Link>
          }
        />

        {isLoading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            {[1, 2, 3, 4].map((k) => (
              <Skeleton key={k} className="h-48" />
            ))}
          </div>
        ) : articles.length === 0 ? null : (
          <div className="grid grid-cols-1 lg:grid-cols-12 gap-10">
            {lead && (
              <Link to={`/articles/${lead.slug}`} className="group lg:col-span-7 block">
                {lead.featuredImage ? (
                  <img
                    src={lead.featuredImage}
                    alt={lead.title}
                    loading="lazy"
                    className="w-full h-56 md:h-72 object-cover mb-5 bg-muted rounded-2xl"
                  />
                ) : (
                  <ImageFallback className="w-full h-56 md:h-72 mb-5" />
                )}
                <p className="section-kicker">{lead.category}</p>
                <h3 className="font-display font-semibold text-2xl md:text-3xl leading-tight group-hover:text-crimson transition-colors mb-3">
                  {lead.title}
                </h3>
                <p className="text-muted-foreground text-[15px] leading-relaxed line-clamp-3 mb-4">
                  {lead.excerpt}
                </p>
                <div className="flex items-center gap-4 text-xs text-muted-foreground">
                  <span className="flex items-center gap-1">
                    <User className="w-3 h-3" />
                    {lead.author}
                  </span>
                  <span>{lead.date}</span>
                  <span className="flex items-center gap-1">
                    <Clock className="w-3 h-3" />
                    {lead.readTime}
                  </span>
                </div>
              </Link>
            )}
            <div className="lg:col-span-5 divide-y divide-border">
              {rest.map((article) => (
                <Link key={article.slug} to={`/articles/${article.slug}`} className="group flex gap-4 py-5 first:pt-0 last:pb-0">
                  {article.featuredImage ? (
                    <img
                      src={article.featuredImage}
                      alt={article.title}
                      loading="lazy"
                      className="w-24 h-24 object-cover shrink-0 bg-muted rounded-xl"
                    />
                  ) : (
                    <ImageFallback className="w-24 h-24 shrink-0" />
                  )}
                  <div className="min-w-0">
                    <p className="section-kicker">{article.category}</p>
                    <h3 className="font-display font-semibold text-base leading-snug group-hover:text-crimson transition-colors line-clamp-3 mb-2">
                      {article.title}
                    </h3>
                    <p className="text-xs text-muted-foreground">{article.date}</p>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        )}

        <Link
          to="/articles"
          className="text-foreground font-medium hover:text-crimson mt-8 block md:hidden"
        >
          All essays →
        </Link>
      </div>
    </section>
  );
};

export default FeaturedArticles;
