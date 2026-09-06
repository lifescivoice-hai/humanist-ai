import { useState } from "react";

type Sponsor = {
  name: string;
  domain: string;
};

const SPONSORS: Sponsor[] = [
  { name: "Novartis", domain: "novartis.com" },
  { name: "United Airlines", domain: "united.com" },
  { name: "Bristol Myers Squibb", domain: "bms.com" },
  { name: "Liberty Mutual", domain: "libertymutual.com" },
  { name: "Casper", domain: "casper.com" },
  { name: "Sanofi", domain: "sanofi.com" },
  { name: "Target", domain: "target.com" },
  { name: "McDonald's", domain: "mcdonalds.com" },
  { name: "ADP", domain: "adp.com" },
  { name: "Atlantic Health System", domain: "atlantichealth.org" },
];

const logoSources = (domain: string) => [
  `https://logo.clearbit.com/${domain}`,
  `https://www.google.com/s2/favicons?domain=${domain}&sz=128`,
];

function SponsorLogo({ name, domain }: Sponsor) {
  const [sourceIndex, setSourceIndex] = useState(0);
  const sources = logoSources(domain);
  const src = sources[sourceIndex];

  if (!src) {
    return <span className="h-10 md:h-12" aria-hidden />;
  }

  return (
    <img
      src={src}
      alt=""
      className="h-10 md:h-12 w-auto max-w-[10rem] object-contain opacity-90 transition duration-300 group-hover:opacity-100"
      loading="lazy"
      onError={() => setSourceIndex((i) => i + 1)}
    />
  );
}

const SponsorsSection = () => {
  const loop = [...SPONSORS, ...SPONSORS];

  return (
    <section className="py-12 md:py-16 bg-secondary/40 border-y border-border" aria-label="Our Corporate Partners">
      <div className="section-container">
        <div className="text-center mb-8 md:mb-10">
          <h2 className="font-display text-2xl md:text-3xl font-bold text-foreground">
            Our Corporate Partners
          </h2>
        </div>
      </div>

      <div className="relative overflow-hidden">
        <div className="pointer-events-none absolute inset-y-0 left-0 w-16 md:w-28 bg-gradient-to-r from-secondary/40 to-transparent z-10" />
        <div className="pointer-events-none absolute inset-y-0 right-0 w-16 md:w-28 bg-gradient-to-l from-secondary/40 to-transparent z-10" />

        <div className="flex w-max animate-logo-marquee hover:[animation-play-state:paused]">
          {loop.map((sponsor, index) => (
            <div
              key={`${sponsor.domain}-${index}`}
              className="group flex flex-col items-center justify-center gap-2 mx-6 md:mx-10 min-w-[8.5rem]"
            >
              <SponsorLogo {...sponsor} />
              <span className="text-xs md:text-sm font-medium text-muted-foreground text-center whitespace-nowrap">
                {sponsor.name}
              </span>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default SponsorsSection;
