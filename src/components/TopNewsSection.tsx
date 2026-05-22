import { TrendingUp, ExternalLink } from "lucide-react";
import { Link } from "react-router-dom";
import { useHomepage, useLatestArticles } from "@/hooks/useArticles";
import { Badge } from "@/components/ui/badge";
import { Skeleton } from "@/components/ui/skeleton";

const TopNewsSection = () => {
  // Curated picks from the Homepage single type; if either field is empty,
  // fall back to the most recent articles so the section never goes blank.
  const { data: homepage, isLoading: homepageLoading } = useHomepage();
  const curatedTop = homepage?.weeklyTopArticles ?? [];
  const curatedTitles = homepage?.weeklyTopTitles ?? [];
  const needsFallback =
    !homepageLoading && (curatedTop.length === 0 || curatedTitles.length === 0);
  const { data: latestArticles = [], isLoading: latestLoading } = useLatestArticles(
    needsFallback ? 5 : 0
  );
  const isLoading = homepageLoading || (needsFallback && latestLoading);

  const weeklyTop = (curatedTop.length > 0 ? curatedTop : latestArticles).slice(0, 3);
  const weeklyTopTitles = (curatedTitles.length > 0 ? curatedTitles : latestArticles).slice(0, 5);

  return (
    <section className="py-16 bg-navy">
      <div className="section-container">
        <div className="flex items-center justify-between mb-10">
          <div className="flex items-center gap-3">
            <div className="p-2 rounded-lg bg-crimson">
              <TrendingUp className="w-6 h-6 text-white" />
            </div>
            <div>
              <h2 className="font-display text-3xl md:text-4xl font-bold text-white">
                Top 5 This Week
              </h2>
              <p className="text-white/60 mt-1">The AI news that matters most</p>
            </div>
          </div>
          <Link 
            to="/news" 
            className="text-crimson font-medium hover:text-white transition-colors hidden md:block"
          >
            All News →
          </Link>
        </div>

        {isLoading ? (
          <div className="space-y-4">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              {[1, 2, 3].map((k) => (
                <Skeleton key={k} className="h-36 rounded-xl bg-white/10" />
              ))}
            </div>
            <Skeleton className="h-64 rounded-xl bg-white/10" />
          </div>
        ) : (
          <>
            {/* Weekly Top (3) */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
              {weeklyTop.map((article) => (
                <Link
                  key={article.id}
                  to={`/articles/${article.slug}`}
                  className="group block bg-white/5 backdrop-blur-sm rounded-xl border border-white/10 p-4 hover:bg-white/10 transition-colors"
                >
                  <Badge variant="outline" className="mb-2 border-crimson/60 text-crimson">
                    {article.category}
                  </Badge>
                  <h3 className="font-medium text-white group-hover:text-crimson transition-colors line-clamp-2">
                    {article.title}
                  </h3>
                  <p className="text-xs text-white/50 mt-2">{article.date}</p>
                </Link>
              ))}
            </div>

            {/* Weekly Top Titles (latest 5) */}
            <div className="bg-white/5 backdrop-blur-sm rounded-xl border border-white/10 divide-y divide-white/10">
              {weeklyTopTitles.map((article, index) => (
                <Link
                  key={article.id}
                  to={`/articles/${article.slug}`}
                  className="group flex items-start gap-4 p-4 hover:bg-white/5 transition-colors"
                >
                  <span className="font-display text-3xl font-bold text-crimson/50 group-hover:text-crimson transition-colors">
                    {String(index + 1).padStart(2, "0")}
                  </span>
                  <div className="flex-1 min-w-0">
                    <h3 className="font-medium text-white group-hover:text-crimson transition-colors line-clamp-2">
                      {article.title}
                    </h3>
                    <p className="text-sm text-white/50 mt-1 flex items-center gap-1">
                      {article.author}
                      <ExternalLink className="w-3 h-3" />
                    </p>
                  </div>
                </Link>
              ))}
            </div>
          </>
        )}

        <Link 
          to="/news" 
          className="text-crimson font-medium hover:text-white transition-colors mt-6 block md:hidden text-center"
        >
          View All News →
        </Link>
      </div>
    </section>
  );
};

export default TopNewsSection;
