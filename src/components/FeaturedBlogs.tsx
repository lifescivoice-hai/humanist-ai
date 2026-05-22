import blog1 from "@/assets/blog-1.jpg";
import blog2 from "@/assets/blog-2.jpg";
import blog3 from "@/assets/blog-3.jpg";
import { Badge } from "@/components/ui/badge";
import { Clock, Calendar, ArrowUpRight, Sparkles } from "lucide-react";
import { Link } from "react-router-dom";
import { useLatestArticles } from "@/hooks/useArticles";
import { Skeleton } from "@/components/ui/skeleton";

const FALLBACK_IMAGES = [blog1, blog2, blog3];

interface BlogItem {
  slug: string;
  image: string;
  title: string;
  excerpt: string;
  category: string;
  readTime: string;
  date: string;
}

/** Big editorial hero — image fills the card, text overlays at the bottom. */
const HeroBlogCard = ({ blog }: { blog: BlogItem }) => (
  <Link
    to={`/articles/${blog.slug}`}
    className="group relative block overflow-hidden rounded-2xl bg-card shadow-card hover:shadow-hover transition-all duration-500 md:row-span-2 min-h-[20rem] md:min-h-[28rem]"
  >
    <img
      src={blog.image}
      alt={blog.title}
      loading="lazy"
      className="absolute inset-0 w-full h-full object-cover group-hover:scale-105 transition-transform duration-700"
    />
    {/* Gradient overlay so text stays readable */}
    <div className="absolute inset-0 bg-gradient-to-t from-black/85 via-black/40 to-black/10" />

    {/* Floating "Featured" pill */}
    <div className="absolute top-4 left-4 flex items-center gap-1.5 px-3 py-1 rounded-full bg-white/15 backdrop-blur-md border border-white/20 text-white text-[11px] font-semibold uppercase tracking-wider">
      <Sparkles className="w-3 h-3" />
      Featured
    </div>

    {/* Hover arrow chip */}
    <div className="absolute top-4 right-4 w-10 h-10 rounded-full bg-crimson text-white flex items-center justify-center opacity-0 group-hover:opacity-100 translate-y-2 group-hover:translate-y-0 transition-all duration-300">
      <ArrowUpRight className="w-5 h-5" />
    </div>

    {/* Bottom text block */}
    <div className="absolute inset-x-0 bottom-0 p-6 md:p-8 text-white">
      <Badge className="bg-crimson text-white border-none mb-3">{blog.category}</Badge>
      <h3 className="font-display font-bold text-2xl md:text-3xl lg:text-4xl leading-tight mb-3 group-hover:translate-x-1 transition-transform duration-300">
        {blog.title}
      </h3>
      <p className="text-white/80 text-sm md:text-base line-clamp-2 mb-4 max-w-xl">
        {blog.excerpt}
      </p>
      <div className="flex items-center gap-4 text-xs text-white/70">
        <span className="flex items-center gap-1.5">
          <Calendar className="w-3.5 h-3.5" />
          {blog.date}
        </span>
        <span className="w-1 h-1 rounded-full bg-white/40" aria-hidden />
        <span className="flex items-center gap-1.5">
          <Clock className="w-3.5 h-3.5" />
          {blog.readTime}
        </span>
      </div>
    </div>
  </Link>
);

/** Compact horizontal blog card — image left, content right. */
const CompactBlogCard = ({ blog, index }: { blog: BlogItem; index: number }) => (
  <Link
    to={`/articles/${blog.slug}`}
    className="group relative flex gap-4 p-4 rounded-2xl bg-card border border-border hover:border-crimson/40 hover:shadow-hover transition-all duration-300 overflow-hidden"
  >
    {/* Hover side bar */}
    <span
      className="absolute left-0 top-0 h-full w-1 bg-crimson scale-y-0 group-hover:scale-y-100 origin-top transition-transform duration-300"
      aria-hidden
    />

    <div className="relative shrink-0">
      <img
        src={blog.image}
        alt={blog.title}
        loading="lazy"
        className="w-28 h-28 md:w-32 md:h-32 object-cover rounded-xl"
      />
      {/* Tiny number stamp on the image corner */}
      <span className="absolute -top-2 -left-2 font-display font-bold text-white text-xs bg-navy h-7 w-7 flex items-center justify-center rounded-full shadow-md">
        {String(index + 2).padStart(2, "0")}
      </span>
    </div>

    <div className="flex-1 min-w-0 flex flex-col">
      <div className="flex items-center gap-2 mb-1.5 flex-wrap">
        <Badge variant="outline" className="text-crimson border-crimson/30 text-[10px]">
          {blog.category}
        </Badge>
        <span className="text-[11px] text-muted-foreground">{blog.date}</span>
      </div>
      <h3 className="font-display font-semibold text-foreground group-hover:text-crimson transition-colors text-base md:text-lg line-clamp-2 mb-1">
        {blog.title}
      </h3>
      <p className="text-muted-foreground text-xs line-clamp-2 mb-2 hidden sm:block">
        {blog.excerpt}
      </p>
      <div className="mt-auto flex items-center justify-between text-[11px] text-muted-foreground">
        <span className="flex items-center gap-1">
          <Clock className="w-3 h-3" />
          {blog.readTime}
        </span>
        <ArrowUpRight className="w-4 h-4 text-crimson opacity-0 group-hover:opacity-100 transition-opacity" />
      </div>
    </div>
  </Link>
);

const FeaturedBlogs = () => {
  const { data: items = [], isLoading } = useLatestArticles(3);

  const blogs: BlogItem[] = items.slice(0, 3).map((a, i) => ({
    slug: a.slug,
    image: a.featuredImage || FALLBACK_IMAGES[i % FALLBACK_IMAGES.length],
    title: a.title,
    excerpt: a.excerpt,
    category: a.category,
    readTime: a.readTime,
    date: a.date,
  }));

  const [hero, ...rest] = blogs;

  return (
    <section className="relative py-16 md:py-20 bg-background overflow-hidden">
      {/* Decorative background accents — keep subtle so text stays the focus */}
      <div
        className="pointer-events-none absolute -top-24 -right-24 w-96 h-96 rounded-full bg-crimson/5 blur-3xl"
        aria-hidden
      />
      <div
        className="pointer-events-none absolute -bottom-24 -left-24 w-96 h-96 rounded-full bg-navy/5 blur-3xl"
        aria-hidden
      />

      <div className="section-container relative">
        {/* Header */}
        <div className="flex items-end justify-between mb-10 gap-4 flex-wrap">
          <div className="flex-1 min-w-[15rem]">
            <div className="inline-flex items-center gap-1.5 px-3 py-1 bg-crimson text-white text-xs font-medium uppercase tracking-wider rounded-full mb-3">
              <Sparkles className="w-3 h-3" />
              Today's Reads
            </div>
            <h2 className="font-display text-3xl md:text-5xl font-bold text-foreground leading-tight">
              Latest{" "}
              <span className="relative inline-block">
                <span className="relative z-10">Blogs</span>
                <span
                  className="absolute left-0 right-0 bottom-1 h-2 md:h-3 bg-crimson/20 -z-0"
                  aria-hidden
                />
              </span>
            </h2>
            <p className="text-muted-foreground mt-2 max-w-md">
              Fresh perspectives for the algorithmic age — curated daily.
            </p>
          </div>
          <Link
            to="/blogs"
            className="hidden md:inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-navy text-white text-sm font-medium hover:bg-crimson transition-colors group"
          >
            View All Blogs
            <ArrowUpRight className="w-4 h-4 group-hover:translate-x-0.5 group-hover:-translate-y-0.5 transition-transform" />
          </Link>
        </div>

        {/* Magazine grid */}
        {isLoading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Skeleton className="h-[28rem] rounded-2xl" />
            <div className="space-y-6">
              <Skeleton className="h-[13rem] rounded-2xl" />
              <Skeleton className="h-[13rem] rounded-2xl" />
            </div>
          </div>
        ) : blogs.length === 0 ? null : (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {hero && <HeroBlogCard blog={hero} />}
            <div className="grid grid-cols-1 gap-6">
              {rest.map((blog, index) => (
                <CompactBlogCard key={blog.slug || index} blog={blog} index={index} />
              ))}
            </div>
          </div>
        )}

        <Link
          to="/blogs"
          className="text-navy font-medium hover:text-crimson transition-colors mt-8 inline-flex md:hidden items-center gap-1 w-full justify-center"
        >
          View All Blogs <ArrowUpRight className="w-4 h-4" />
        </Link>
      </div>
    </section>
  );
};

export default FeaturedBlogs;
