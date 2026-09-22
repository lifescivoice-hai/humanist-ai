import { ArrowUpRight } from "lucide-react";
import { Link } from "react-router-dom";
import { useHomepageSections } from "@/hooks/useArticles";
import { Skeleton } from "@/components/ui/skeleton";
import SectionHeader from "@/components/SectionHeader";

const TopNewsSection = () => {
  const { topFive, isLoading } = useHomepageSections();

  return (
    <section className="py-16 md:py-20 bg-secondary/70">
      <div className="section-container">
        <SectionHeader
          kicker="This week"
          title="Five to watch"
          description="The stories published this week, excluding pieces already on the front page and in Latest."
          action={
            <Link
              to="/articles"
              className="hidden md:inline-flex items-center gap-1 text-sm font-semibold text-navy hover:text-crimson"
            >
              All coverage
              <ArrowUpRight className="w-4 h-4" />
            </Link>
          }
        />

        {isLoading ? (
          <div className="space-y-3">
            {[1, 2, 3, 4, 5].map((k) => (
              <Skeleton key={k} className="h-20 rounded-2xl" />
            ))}
          </div>
        ) : (
          <ol className="grid gap-3">
            {topFive.map((article, index) => (
              <li key={article.id}>
                <Link
                  to={`/articles/${article.slug}`}
                  className="group grid grid-cols-[3.25rem_1fr] md:grid-cols-[4.25rem_1fr_auto] gap-4 md:gap-6 items-center rounded-2xl bg-card px-4 py-4 md:px-6 shadow-card hover:shadow-hover transition-shadow"
                >
                  <span className="font-display text-2xl md:text-3xl text-crimson">
                    {String(index + 1).padStart(2, "0")}
                  </span>
                  <div className="min-w-0">
                    <p className="section-kicker mb-1">{article.category}</p>
                    <h3 className="font-display text-lg md:text-xl font-semibold text-foreground group-hover:text-crimson transition-colors leading-snug">
                      {article.title}
                    </h3>
                    <p className="text-sm text-muted-foreground mt-1">
                      {article.author}
                      <span className="mx-2" aria-hidden>
                        ·
                      </span>
                      {article.date}
                    </p>
                  </div>
                  <span className="hidden md:block text-xs text-muted-foreground">
                    {article.readTime}
                  </span>
                </Link>
              </li>
            ))}
          </ol>
        )}

        <Link
          to="/articles"
          className="text-navy font-semibold hover:text-crimson mt-8 block md:hidden text-center"
        >
          All coverage →
        </Link>
      </div>
    </section>
  );
};

export default TopNewsSection;
