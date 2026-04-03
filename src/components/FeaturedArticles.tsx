import { Badge } from "@/components/ui/badge";
import { Clock, User, ArrowRight } from "lucide-react";
import { Link } from "react-router-dom";
import { useLatestArticles } from "@/hooks/useArticles";
import { Skeleton } from "@/components/ui/skeleton";

interface ArticleCardProps {
  slug: string;
  title: string;
  excerpt: string;
  author: string;
  category: string;
  readTime: string;
  date: string;
  featured?: boolean;
}

const ArticleCard = ({
  slug,
  title,
  excerpt,
  author,
  category,
  readTime,
  date,
  featured = false,
}: ArticleCardProps) => {
  return (
    <Link
      to={`/articles/${slug}`}
      className={`group block p-6 rounded-xl bg-card border border-border hover:border-crimson/30 hover:shadow-hover transition-all duration-300 ${featured ? "md:col-span-2" : ""}`}
    >
      <div className="flex items-center gap-3 mb-4">
        <Badge variant="outline" className="text-crimson border-crimson/30">
          {category}
        </Badge>
        <span className="text-xs text-muted-foreground">{date}</span>
      </div>
      <h3
        className={`font-display font-semibold text-foreground group-hover:text-crimson transition-colors mb-3 ${featured ? "text-xl md:text-2xl" : "text-lg"}`}
      >
        {title}
      </h3>
      <p className="text-muted-foreground text-sm line-clamp-2 mb-4">{excerpt}</p>
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-4 text-xs text-muted-foreground">
          <span className="flex items-center gap-1">
            <User className="w-3 h-3" />
            {author}
          </span>
          <span className="flex items-center gap-1">
            <Clock className="w-3 h-3" />
            {readTime}
          </span>
        </div>
        <ArrowRight className="w-4 h-4 text-crimson opacity-0 group-hover:opacity-100 transition-opacity" />
      </div>
    </Link>
  );
};

const FeaturedArticles = () => {
  const { data: items = [], isLoading } = useLatestArticles(5);

  const articles = items.slice(0, 5).map((a, i) => ({
    slug: a.slug,
    title: a.title,
    excerpt: a.excerpt,
    author: a.author,
    category: a.category,
    readTime: a.readTime,
    date: a.date,
    featured: i === 0,
  }));

  return (
    <section className="py-16 bg-secondary/30 border-l-4 border-navy">
      <div className="section-container">
        <div className="flex items-center justify-between mb-10">
          <div>
            <div className="inline-block px-3 py-1 bg-navy text-white text-xs font-medium uppercase tracking-wider rounded mb-3">
              Deep Dives
            </div>
            <h2 className="font-display text-3xl md:text-4xl font-bold text-foreground">Featured Articles</h2>
            <p className="text-muted-foreground mt-2">In-depth analysis and thought leadership</p>
          </div>
          <Link
            to="/articles"
            className="text-navy font-medium hover:text-crimson transition-colors hidden md:block"
          >
            View All →
          </Link>
        </div>

        {isLoading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {[1, 2, 3, 4, 5].map((k) => (
              <Skeleton key={k} className="h-48 rounded-xl" />
            ))}
          </div>
        ) : articles.length === 0 ? null : (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {articles.map((article, index) => (
              <ArticleCard key={article.slug || index} {...article} />
            ))}
          </div>
        )}

        <Link
          to="/articles"
          className="text-navy font-medium hover:text-crimson transition-colors mt-6 block md:hidden text-center"
        >
          View All Articles →
        </Link>
      </div>
    </section>
  );
};

export default FeaturedArticles;
