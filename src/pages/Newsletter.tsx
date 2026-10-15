import { Link, useParams } from "react-router-dom";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { getDispatchEdition } from "@/data/dispatch";
import { ChevronLeft } from "lucide-react";

const Newsletter = () => {
  const { slug } = useParams<{ slug: string }>();
  const edition = getDispatchEdition(slug);

  if (!edition || !edition.available) {
    return (
      <div className="min-h-screen flex flex-col">
        <Header />
        <main className="flex-1">
          <div className="section-container py-16 md:py-20 max-w-3xl">
            <p className="section-kicker">The Dispatch</p>
            <h1 className="font-display text-3xl md:text-4xl font-semibold text-foreground mb-4">
              {edition ? edition.quarter : "Edition not found"}
            </h1>
            <p className="text-muted-foreground leading-relaxed mb-8">
              {edition?.note ?? "This briefing is not available."}
            </p>
            <Link to="/" className="text-sm font-medium text-navy hover:text-crimson">
              Back to the homepage
            </Link>
          </div>
        </main>
        <Footer />
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      <main className="flex-1">
        <section className="bg-navy text-primary-foreground">
          <div className="section-container py-12 md:py-16">
            <Link
              to="/"
              className="inline-flex items-center gap-2 text-sm text-primary-foreground/75 hover:text-white mb-8"
            >
              <ChevronLeft className="w-4 h-4" />
              Home
            </Link>
            <p className="section-kicker text-crimson-light">
              The Dispatch · {edition.quarter} ({edition.period})
            </p>
            <h1 className="font-display text-3xl md:text-5xl font-semibold max-w-3xl leading-tight">
              {edition.title}
            </h1>
          </div>
        </section>

        <article className="section-container py-12 md:py-16 max-w-3xl">
          <div className="space-y-5 text-[17px] leading-relaxed text-foreground/85">
            {edition.intro.map((paragraph) => (
              <p key={paragraph}>{paragraph}</p>
            ))}
          </div>

          <div className="mt-12 space-y-10">
            {edition.stories.map((story, index) => (
              <section key={story.headline} className="border-t border-border pt-8">
                <p className="text-xs font-semibold tracking-wide text-crimson mb-2">
                  {String(index + 1).padStart(2, "0")}
                </p>
                <h2 className="font-display text-2xl md:text-3xl font-semibold text-foreground mb-4">
                  {story.headline}
                </h2>
                <div className="space-y-4 text-[17px] leading-relaxed text-foreground/85">
                  {story.paragraphs.map((paragraph) => (
                    <p key={paragraph}>{paragraph}</p>
                  ))}
                </div>
              </section>
            ))}
          </div>

          <div className="mt-12 border-t border-border pt-8 space-y-5 text-[17px] leading-relaxed text-foreground/85">
            {edition.closing.map((paragraph) => (
              <p key={paragraph}>{paragraph}</p>
            ))}
          </div>
        </article>
      </main>
      <Footer />
    </div>
  );
};

export default Newsletter;
