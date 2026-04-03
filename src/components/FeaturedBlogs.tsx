import blog1 from "@/assets/blog-1.jpg";
import blog2 from "@/assets/blog-2.jpg";
import blog3 from "@/assets/blog-3.jpg";
import { Badge } from "@/components/ui/badge";
import { Clock, Calendar } from "lucide-react";
import { Link } from "react-router-dom";
import { useLatestArticles } from "@/hooks/useArticles";
import { Skeleton } from "@/components/ui/skeleton";

const FALLBACK_IMAGES = [blog1, blog2, blog3];

interface BlogCardProps {
  slug: string;
  image: string;
  title: string;
  excerpt: string;
  category: string;
  readTime: string;
  date: string;
  featured?: boolean;
}

const BlogCard = ({
  slug,
  image,
  title,
  excerpt,
  category,
  readTime,
  date,
  featured = false,
}: BlogCardProps) => {
  return (
    <Link
      to={`/articles/${slug}`}
      className={`group block overflow-hidden rounded-xl bg-card shadow-card hover:shadow-hover transition-all duration-300 ${featured ? "md:col-span-2 md:row-span-2" : ""}`}
    >
      <div className={`relative overflow-hidden ${featured ? "aspect-video" : "aspect-video"}`}>
        <img
          src={image}
          alt={title}
          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
        />
        <Badge className="absolute top-4 left-4 bg-crimson text-accent-foreground border-none">
          {category}
        </Badge>
      </div>
      <div className="p-5">
        <h3
          className={`font-display font-semibold text-foreground group-hover:text-crimson transition-colors ${featured ? "text-xl md:text-2xl" : "text-lg"}`}
        >
          {title}
        </h3>
        <p className="text-muted-foreground text-sm mt-2 line-clamp-2">{excerpt}</p>
        <div className="flex items-center gap-4 mt-4 text-xs text-muted-foreground">
          <span className="flex items-center gap-1">
            <Clock className="w-3 h-3" />
            {readTime}
          </span>
          <span className="flex items-center gap-1">
            <Calendar className="w-3 h-3" />
            {date}
          </span>
        </div>
      </div>
    </Link>
  );
};

const FeaturedBlogs = () => {
  const { data: items = [], isLoading } = useLatestArticles(3);

  const blogs = items.map((a, i) => ({
    slug: a.slug,
    image: a.featuredImage || FALLBACK_IMAGES[i % FALLBACK_IMAGES.length],
    title: a.title,
    excerpt: a.excerpt,
    category: a.category,
    readTime: a.readTime,
    date: a.date,
    featured: i === 0,
  }));

  return (
    <section className="py-16 bg-background">
      <div className="section-container">
        <div className="flex items-center justify-between mb-10">
          <div>
            <div className="inline-block px-3 py-1 bg-crimson text-white text-xs font-medium uppercase tracking-wider rounded mb-3">
              Today's Reads
            </div>
            <h2 className="font-display text-3xl md:text-4xl font-bold text-foreground">Latest Blogs</h2>
            <p className="text-muted-foreground mt-2">Fresh perspectives for the algorithmic age</p>
          </div>
          <Link
            to="/blogs"
            className="text-navy font-medium hover:text-crimson transition-colors hidden md:block"
          >
            View All →
          </Link>
        </div>

        {isLoading ? (
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {[1, 2, 3].map((k) => (
              <Skeleton key={k} className="h-80 rounded-xl" />
            ))}
          </div>
        ) : blogs.length === 0 ? null : (
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {blogs.map((blog, index) => (
              <BlogCard key={blog.slug || index} {...blog} />
            ))}
          </div>
        )}

        <Link
          to="/blogs"
          className="text-navy font-medium hover:text-crimson transition-colors mt-6 block md:hidden text-center"
        >
          View All Blogs →
        </Link>
      </div>
    </section>
  );
};

export default FeaturedBlogs;
