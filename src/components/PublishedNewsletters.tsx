import { Calendar, ArrowRight } from "lucide-react";
import { Link } from "react-router-dom";
import { Badge } from "@/components/ui/badge";
import BorderGlow, { BRAND_GLOW_COLORS } from "@/components/BorderGlow";

interface NewsletterCardProps {
  issue: number;
  title: string;
  excerpt: string;
  date: string;
  topics: string[];
}

const NewsletterCard = ({ issue, title, excerpt, date, topics }: NewsletterCardProps) => {
  return (
    <BorderGlow
      className="h-full border-glow-fill"
      glowColor="228 58 42"
      backgroundColor="#ffffff"
      colors={[...BRAND_GLOW_COLORS]}
      borderRadius={16}
      glowRadius={24}
      glowIntensity={0.95}
      coneSpread={22}
      edgeSensitivity={24}
      fillOpacity={0.28}
    >
      <Link to={`/newsletters/${issue}`} className="group block p-6 h-full">
        <div className="flex items-center justify-between mb-4">
          <span className="text-sm font-medium text-crimson">Issue #{issue}</span>
          <span className="flex items-center gap-1 text-xs text-muted-foreground">
            <Calendar className="w-3 h-3" />
            {date}
          </span>
        </div>
        <h3 className="font-display text-lg font-semibold text-foreground group-hover:text-crimson transition-colors mb-2">
          {title}
        </h3>
        <p className="text-muted-foreground text-sm line-clamp-2 mb-4">{excerpt}</p>
        <div className="flex items-center justify-between">
          <div className="flex flex-wrap gap-2">
            {topics.slice(0, 2).map((topic) => (
              <Badge key={topic} variant="secondary" className="text-xs">
                {topic}
              </Badge>
            ))}
          </div>
          <ArrowRight className="w-4 h-4 text-crimson opacity-0 group-hover:opacity-100 transition-opacity" />
        </div>
      </Link>
    </BorderGlow>
  );
};

const PublishedNewsletters = () => {
  const newsletters = [
    {
      issue: 52,
      title: "The Year Ahead: AI Predictions for 2026",
      excerpt: "Our expert panel weighs in on the trends that will shape enterprise AI adoption this year.",
      date: "Jan 12, 2026",
      topics: ["Predictions", "Strategy", "Trends"],
    },
    {
      issue: 51,
      title: "Building AI Governance Frameworks",
      excerpt: "A step-by-step guide to establishing responsible AI policies in your organization.",
      date: "Jan 5, 2026",
      topics: ["Governance", "Ethics", "Policy"],
    },
    {
      issue: 50,
      title: "The Human-AI Collaboration Playbook",
      excerpt: "Case studies from companies successfully integrating AI into their workforce strategy.",
      date: "Dec 29, 2025",
      topics: ["Workforce", "Case Studies"],
    },
    {
      issue: 49,
      title: "Navigating AI Talent Acquisition",
      excerpt: "How to attract and retain the hybrid talent your organization needs.",
      date: "Dec 22, 2025",
      topics: ["Talent", "HR", "Hiring"],
    },
  ];

  return (
    <section className="py-16 md:py-20 bg-background">
      <div className="section-container">
        <div className="flex items-end justify-between mb-10 pb-4 border-b border-border">
          <div>
            <p className="section-kicker">Archive</p>
            <h2 className="font-display text-3xl md:text-4xl font-semibold text-foreground">
              The Dispatch
            </h2>
            <p className="text-muted-foreground mt-2">Past editions of The Humanist AI weekly briefing</p>
          </div>
          <Link 
            to="/newsletters" 
            className="text-navy font-medium hover:text-crimson transition-colors hidden md:block"
          >
            View Archive →
          </Link>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {newsletters.map((newsletter) => (
            <NewsletterCard key={newsletter.issue} {...newsletter} />
          ))}
        </div>

        <Link 
          to="/newsletters" 
          className="text-navy font-medium hover:text-crimson transition-colors mt-6 block md:hidden text-center"
        >
          View All Newsletters →
        </Link>
      </div>
    </section>
  );
};

export default PublishedNewsletters;
