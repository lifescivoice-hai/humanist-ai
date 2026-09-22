import { Link } from "react-router-dom";
import heroBg from "@/assets/hero-bg.jpg";
import blog1 from "@/assets/blog-1.jpg";
import blog2 from "@/assets/blog-2.jpg";
import blog3 from "@/assets/blog-3.jpg";
import { useHomepageSections, useCategories } from "@/hooks/useArticles";
import { Skeleton } from "@/components/ui/skeleton";
import BorderGlow, { BRAND_GLOW_COLORS } from "@/components/BorderGlow";

const FALLBACK_IMAGES = [heroBg, blog1, blog2, blog3];

const pickImage = (url: string | null | undefined, index: number) =>
  url || FALLBACK_IMAGES[index % FALLBACK_IMAGES.length];

const mediaGlow = {
  glowColor: "356 78 58",
  backgroundColor: "#1B2A61",
  colors: [...BRAND_GLOW_COLORS],
  borderRadius: 28,
  glowRadius: 28,
  glowIntensity: 1.15,
  coneSpread: 22,
  edgeSensitivity: 22,
  fillOpacity: 0.35,
};

const lightGlow = {
  glowColor: "228 58 42",
  backgroundColor: "#ffffff",
  colors: [...BRAND_GLOW_COLORS],
  borderRadius: 16,
  glowRadius: 24,
  glowIntensity: 0.95,
  coneSpread: 22,
  edgeSensitivity: 24,
  fillOpacity: 0.28,
};

const HeroSection = () => {
  const { hero: articles, isLoading, isError } = useHomepageSections();
  const { data: categories = [] } = useCategories(12);

  const [featured, ...rest] = articles;
  const sideArticles = rest.slice(0, 2);
  const bottomArticles = rest.slice(2, 6);

  if (isLoading && !featured) {
    return (
      <section className="bg-secondary/60">
        <div className="section-container py-8 lg:py-12">
          <Skeleton className="h-[320px] lg:h-[420px] w-full rounded-2xl" />
        </div>
      </section>
    );
  }

  if (isError || !featured) {
    return null;
  }

  return (
    <section className="bg-secondary/60">
      <div className="section-container py-8 lg:py-12">
        <div className="flex items-baseline justify-between gap-4 mb-6">
          <p className="section-kicker mb-0">Today</p>
          <p className="hidden md:block text-[13px] text-muted-foreground">
            Human relevance in the algorithmic age
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 lg:gap-7">
          <div className="lg:col-span-7">
            <BorderGlow className="h-full min-h-[320px] lg:min-h-[440px] border-glow-fill border-glow-media" {...mediaGlow}>
              <Link to={`/articles/${featured.slug}`} className="group relative block h-full min-h-[320px] lg:min-h-[440px] overflow-hidden rounded-[inherit]">
                <img
                  src={pickImage(featured.featuredImage, 0)}
                  alt={featured.title}
                  className="absolute inset-0 w-full h-full object-cover transition-transform duration-700 group-hover:scale-[1.03]"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-navy/90 via-navy/35 to-transparent" />
                <div className="absolute bottom-0 left-0 right-0 p-4 md:p-5">
                  <p className="section-kicker text-crimson-light">{featured.category}</p>
                  <h1 className="font-display text-lg md:text-xl lg:text-2xl font-semibold text-white leading-snug mb-2 group-hover:text-crimson-light transition-colors">
                    {featured.title}
                  </h1>
                  <p className="text-white/75 text-xs md:text-sm leading-relaxed line-clamp-2 mb-2 hidden md:block">
                    {featured.excerpt}
                  </p>
                  <div className="flex items-center gap-3 text-[11px] text-white/70">
                    <span className="text-white">{featured.author}</span>
                    <span aria-hidden>·</span>
                    <span>{featured.date}</span>
                    <span aria-hidden>·</span>
                    <span>{featured.readTime}</span>
                  </div>
                </div>
              </Link>
            </BorderGlow>
          </div>

          <div className="lg:col-span-5 grid grid-cols-2 lg:grid-cols-1 gap-6">
            {sideArticles.map((article, index) => (
              <BorderGlow
                key={article.id}
                className="h-full min-h-[150px] lg:min-h-[200px] border-glow-fill border-glow-media"
                {...mediaGlow}
              >
                <Link
                  to={`/articles/${article.slug}`}
                  className="group relative block h-full min-h-[150px] lg:min-h-[200px] overflow-hidden rounded-[inherit]"
                >
                  <img
                    src={pickImage(article.featuredImage, index + 1)}
                    alt={article.title}
                    className="absolute inset-0 w-full h-full object-cover transition-transform duration-700 group-hover:scale-[1.03]"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-navy/85 via-navy/30 to-transparent" />
                  <div className="absolute bottom-0 left-0 right-0 p-3 md:p-4">
                    <p className="section-kicker text-crimson-light mb-1">{article.category}</p>
                    <h2 className="font-display text-xs md:text-sm font-semibold text-white leading-snug group-hover:text-crimson-light transition-colors line-clamp-2">
                      {article.title}
                    </h2>
                  </div>
                </Link>
              </BorderGlow>
            ))}
          </div>
        </div>

        {bottomArticles.length > 0 && (
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-6 mt-8">
            {bottomArticles.map((article) => (
              <BorderGlow key={article.id} className="h-full border-glow-fill" {...lightGlow}>
                <Link to={`/articles/${article.slug}`} className="group block p-5 h-full">
                  <p className="section-kicker">{article.category}</p>
                  <h3 className="font-display text-base md:text-lg font-semibold text-foreground leading-snug group-hover:text-crimson transition-colors line-clamp-3 mb-2">
                    {article.title}
                  </h3>
                  <p className="text-xs text-muted-foreground">{article.author}</p>
                </Link>
              </BorderGlow>
            ))}
          </div>
        )}

        <div className="mt-8 flex flex-wrap items-center gap-x-3 gap-y-2">
          <span className="text-xs font-semibold text-navy/50">
            Browse
          </span>
          {categories.slice(0, 8).map((category) => (
            <Link
              key={category.id}
              to={`/categories/${category.slug}`}
              className="rounded-full bg-card px-3 py-1 text-[13px] text-navy hover:bg-crimson hover:text-white transition-colors"
            >
              {category.name}
            </Link>
          ))}
        </div>
      </div>
    </section>
  );
};

export default HeroSection;
