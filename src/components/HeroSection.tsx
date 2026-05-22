import { Link } from "react-router-dom";
import heroBg from "@/assets/hero-bg.jpg";
import blog1 from "@/assets/blog-1.jpg";
import blog2 from "@/assets/blog-2.jpg";
import blog3 from "@/assets/blog-3.jpg";
import { Badge } from "@/components/ui/badge";
import { useHomepage, useLatestArticles, useCategories } from "@/hooks/useArticles";
import { Skeleton } from "@/components/ui/skeleton";

const FALLBACK_IMAGES = [heroBg, blog1, blog2, blog3];

const pickImage = (url: string | null, index: number) =>
  url || FALLBACK_IMAGES[index % FALLBACK_IMAGES.length];

const HeroSection = () => {
  // Curated picks from the homepage single type; fall back to latest if empty.
  const { data: homepage, isLoading: homepageLoading, isError: homepageError } = useHomepage();
  const curated = homepage?.heroArticles ?? [];
  const fallbackEnabled = !homepageLoading && !homepageError && curated.length === 0;
  const { data: latest = [], isLoading: latestLoading, isError: latestError } = useLatestArticles(
    fallbackEnabled ? 7 : 0
  );
  const articles = curated.length > 0 ? curated : latest;
  const isLoading = homepageLoading || (fallbackEnabled && latestLoading);
  const isError = homepageError && latestError;

  const { data: categories = [] } = useCategories(12);

  const [featured, ...rest] = articles.slice(0, 7);
  const sideArticles = rest.slice(0, 2);
  /** Remaining up to 3 cards in the bottom row (1 featured + 2 side + 3 bottom = 6) */
  const bottomArticles = rest.slice(2, 6);
  const fallbackTrending = [
    "AI Ethics",
    "Leadership",
    "Future of Work",
    "Digital Strategy",
    "HR Tech",
    "Automation",
  ];

  if (isLoading && !featured) {
    return (
      <section className="bg-navy">
        <div className="section-container py-6 lg:py-10">
          <Skeleton className="h-[300px] lg:h-[400px] w-full rounded-xl bg-white/10" />
        </div>
      </section>
    );
  }

  if (isError || !featured) {
    return null;
  }

  return (
    <section className="bg-navy">
      <div className="section-container py-6 lg:py-10">
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-4 lg:gap-6">
          <div className="lg:col-span-7">
            <Link to={`/articles/${featured.slug}`} className="group block cursor-pointer h-full">
              <div className="relative h-full min-h-[300px] lg:min-h-[400px] overflow-hidden rounded-xl">
                <img
                  src={pickImage(featured.featuredImage, 0)}
                  alt={featured.title}
                  className="absolute inset-0 w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-navy via-navy/50 to-transparent" />
                <div className="absolute bottom-0 left-0 right-0 p-5 md:p-8">
                  <Badge className="mb-3 bg-crimson text-white border-none hover:bg-crimson/90">
                    {featured.category}
                  </Badge>
                  <h1 className="font-display text-xl md:text-2xl lg:text-3xl font-bold text-white leading-tight mb-3 group-hover:text-crimson transition-colors">
                    {featured.title}
                  </h1>
                  <p className="text-white/70 text-sm md:text-base leading-relaxed line-clamp-2 mb-3 hidden md:block">
                    {featured.excerpt}
                  </p>
                  <div className="flex items-center gap-3 text-xs md:text-sm text-white/60">
                    <span className="font-medium text-white/80">{featured.author}</span>
                    <span className="w-1 h-1 rounded-full bg-white/40" />
                    <span>{featured.readTime}</span>
                  </div>
                </div>
              </div>
            </Link>
          </div>

          <div className="lg:col-span-5 grid grid-cols-2 lg:grid-cols-1 gap-4">
            {sideArticles.map((article, index) => (
              <Link
                key={article.id}
                to={`/articles/${article.slug}`}
                className="group cursor-pointer relative overflow-hidden rounded-xl block"
              >
                <div className="relative h-full min-h-[160px] lg:min-h-[190px]">
                  <img
                    src={pickImage(article.featuredImage, index + 1)}
                    alt={article.title}
                    className="absolute inset-0 w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-navy via-navy/50 to-navy/20" />
                  <div className="absolute bottom-0 left-0 right-0 p-4 md:p-5">
                    <Badge
                      variant="outline"
                      className="mb-2 text-xs border-white/30 text-white bg-white/10 backdrop-blur-sm"
                    >
                      {article.category}
                    </Badge>
                    <h2 className="font-display text-sm md:text-base lg:text-lg font-semibold text-white leading-snug group-hover:text-crimson transition-colors line-clamp-2">
                      {article.title}
                    </h2>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>

        {bottomArticles.length > 0 && (
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mt-4 lg:mt-6">
            {bottomArticles.map((article, index) => (
              <Link
                key={article.id}
                to={`/articles/${article.slug}`}
                className="group cursor-pointer bg-white/5 backdrop-blur-sm rounded-xl p-4 border border-white/10 hover:border-white/20 hover:bg-white/10 transition-all block"
              >
                <Badge variant="outline" className="mb-2 text-xs border-crimson/50 text-crimson">
                  {article.category}
                </Badge>
                <h3 className="font-display text-sm md:text-base font-semibold text-white leading-snug group-hover:text-crimson transition-colors line-clamp-2 mb-2">
                  {article.title}
                </h3>
                <div className="flex items-center gap-2 text-xs text-white/50">
                  <span className="font-medium text-white/70 truncate">{article.author}</span>
                </div>
              </Link>
            ))}
          </div>
        )}

        <div className="mt-6 pt-5 border-t border-white/10 flex flex-wrap items-center gap-3">
          <span className="text-xs font-medium text-white/50 uppercase tracking-wider mr-2">
            Trending:
          </span>
          {categories.length > 0
            ? categories.slice(0, 8).map((c) => (
                <Link key={c.id} to={`/categories/${c.slug}`} className="inline-block">
                  <Badge
                    variant="outline"
                    className="cursor-pointer border-white/20 text-white/70 hover:bg-crimson hover:border-crimson hover:text-white transition-all text-xs"
                  >
                    {c.name}
                  </Badge>
                </Link>
              ))
            : fallbackTrending.map((topic) => (
                <Badge
                  key={topic}
                  variant="outline"
                  className="cursor-default border-white/20 text-white/70 text-xs"
                >
                  {topic}
                </Badge>
              ))}
        </div>
      </div>
    </section>
  );
};

export default HeroSection;
