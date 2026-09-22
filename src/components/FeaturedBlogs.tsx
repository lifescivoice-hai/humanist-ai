import blog1 from "@/assets/blog-1.jpg";
import blog2 from "@/assets/blog-2.jpg";
import blog3 from "@/assets/blog-3.jpg";
import { Clock, Calendar, ArrowUpRight } from "lucide-react";
import { Link } from "react-router-dom";
import { useHomepageSections } from "@/hooks/useArticles";
import { Skeleton } from "@/components/ui/skeleton";
import SectionHeader from "@/components/SectionHeader";

const FALLBACK_IMAGES = [blog1, blog2, blog3];

const FeaturedBlogs = () => {
  const { latest: items, isLoading } = useHomepageSections();
  const blogs = items.slice(0, 4);
  const [hero, ...rest] = blogs;

  return (
    <section className="py-16 md:py-20 bg-background">
      <div className="section-container">
        <SectionHeader
          kicker="The Briefing"
          title="Latest"
          description="New reporting and commentary, distinct from the stories on the front page."
          action={
            <Link
              to="/blogs"
              className="hidden md:inline-flex items-center gap-2 text-sm font-medium text-foreground hover:text-crimson"
            >
              All latest
              <ArrowUpRight className="w-4 h-4" />
            </Link>
          }
        />

        {isLoading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <Skeleton className="h-[28rem]" />
            <div className="space-y-8">
              <Skeleton className="h-[9rem]" />
              <Skeleton className="h-[9rem]" />
              <Skeleton className="h-[9rem]" />
            </div>
          </div>
        ) : blogs.length === 0 ? null : (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8 md:gap-10">
            {hero && (
              <Link to={`/articles/${hero.slug}`} className="group block">
                <div className="relative overflow-hidden aspect-[4/3] mb-4 bg-muted rounded-2xl">
                  <img
                    src={hero.featuredImage || FALLBACK_IMAGES[0]}
                    alt={hero.title}
                    loading="lazy"
                    className="w-full h-full object-cover"
                  />
                </div>
                <p className="section-kicker">{hero.category}</p>
                <h3 className="font-display font-semibold text-2xl md:text-3xl leading-tight mb-3 group-hover:text-crimson transition-colors">
                  {hero.title}
                </h3>
                <p className="text-muted-foreground text-[15px] leading-relaxed line-clamp-3 mb-4">
                  {hero.excerpt}
                </p>
                <div className="flex items-center gap-4 text-xs text-muted-foreground">
                  <span className="flex items-center gap-1.5">
                    <Calendar className="w-3.5 h-3.5" />
                    {hero.date}
                  </span>
                  <span className="flex items-center gap-1.5">
                    <Clock className="w-3.5 h-3.5" />
                    {hero.readTime}
                  </span>
                </div>
              </Link>
            )}
            <div className="flex flex-col divide-y divide-border">
              {rest.map((blog, index) => (
                <Link
                  key={blog.slug || index}
                  to={`/articles/${blog.slug}`}
                  className="group flex gap-4 py-5 first:pt-0 last:pb-0"
                >
                  <img
                    src={blog.featuredImage || FALLBACK_IMAGES[(index + 1) % FALLBACK_IMAGES.length]}
                    alt={blog.title}
                    loading="lazy"
                    className="w-28 h-28 md:w-32 md:h-32 object-cover shrink-0 bg-muted rounded-xl"
                  />
                  <div className="min-w-0 flex flex-col">
                    <p className="section-kicker">{blog.category}</p>
                    <h3 className="font-display font-semibold text-lg leading-snug group-hover:text-crimson transition-colors line-clamp-3 mb-2">
                      {blog.title}
                    </h3>
                    <p className="text-muted-foreground text-sm line-clamp-2 mb-3 hidden sm:block">
                      {blog.excerpt}
                    </p>
                    <div className="mt-auto text-[11px] text-muted-foreground">{blog.date}</div>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        )}

        <Link
          to="/blogs"
          className="text-foreground font-medium hover:text-crimson mt-8 inline-flex md:hidden items-center gap-1"
        >
          All latest <ArrowUpRight className="w-4 h-4" />
        </Link>
      </div>
    </section>
  );
};

export default FeaturedBlogs;
