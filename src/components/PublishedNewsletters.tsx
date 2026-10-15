import { Calendar, ArrowRight } from "lucide-react";
import { Link } from "react-router-dom";
import { Badge } from "@/components/ui/badge";
import BorderGlow, { BRAND_GLOW_COLORS } from "@/components/BorderGlow";
import { dispatchEditions, type DispatchEdition } from "@/data/dispatch";

const glowProps = {
  className: "h-full border-glow-fill",
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

const CardBody = ({ edition }: { edition: DispatchEdition }) => (
  <div className="p-6 h-full flex flex-col">
    <div className="mb-4">
      <p className="text-sm font-medium text-crimson leading-snug">
        {edition.available ? `${edition.quarter} (${edition.period})` : edition.quarter}
      </p>
      {!edition.available && (
        <span className="mt-1 flex items-center gap-1 text-xs text-muted-foreground">
          <Calendar className="w-3 h-3" />
          {edition.dateLabel}
        </span>
      )}
    </div>
    <h3 className="font-display text-lg font-semibold text-foreground mb-2">{edition.title}</h3>
    <p className="text-muted-foreground text-sm line-clamp-3 mb-4 flex-1">{edition.excerpt}</p>
    <div className="flex items-center justify-between gap-3">
      <div className="flex flex-wrap gap-2">
        {edition.topics.slice(0, 2).map((topic) => (
          <Badge key={topic} variant="secondary" className="text-xs">
            {topic}
          </Badge>
        ))}
      </div>
      {edition.available ? (
        <ArrowRight className="w-4 h-4 text-crimson opacity-0 group-hover:opacity-100 transition-opacity shrink-0" />
      ) : (
        <span className="text-[11px] font-medium text-navy/70 shrink-0">December</span>
      )}
    </div>
  </div>
);

const PublishedNewsletters = () => {
  return (
    <section id="dispatch" className="py-16 md:py-20 bg-background">
      <div className="section-container">
        <div className="mb-10 pb-4 border-b border-border">
          <p className="section-kicker">Archive</p>
          <h2 className="font-display text-3xl md:text-4xl font-semibold text-foreground">
            The Dispatch
          </h2>
          <p className="text-muted-foreground mt-2">
            Quarterly briefings on human relevance in the algorithmic age
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {dispatchEditions.map((edition) => (
            <BorderGlow key={edition.slug} {...glowProps}>
              {edition.available ? (
                <Link to={`/newsletters/${edition.slug}`} className="group block h-full">
                  <CardBody edition={edition} />
                </Link>
              ) : (
                <div className="h-full" aria-label={`${edition.quarter} releases in December`}>
                  <CardBody edition={edition} />
                </div>
              )}
            </BorderGlow>
          ))}
        </div>
      </div>
    </section>
  );
};

export default PublishedNewsletters;
