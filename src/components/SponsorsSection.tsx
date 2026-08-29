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
    return (
      <span className="text-sm md:text-base font-semibold text-navy/80 tracking-tight whitespace-nowrap">
        {name}
      </span>
    );
  }

  return (
    <img
      src={src}
      alt={`${name} logo`}
      title={name}
      className="h-10 md:h-12 w-auto max-w-[10rem] object-contain grayscale opacity-80 transition duration-300 group-hover:grayscale-0 group-hover:opacity-100"
      loading="lazy"
      onError={() => setSourceIndex((i) => i + 1)}
    />
  );
}

const SponsorsSection = () => {
  const loop = [...SPONSORS, ...SPONSORS];

  return (
    <section className="py-12 md:py-16 bg-secondary/40 border-y border-border" aria-label="Our Corporate Sponsors">
      <div className="section-container">
        <div className="text-center mb-8 md:mb-10">
          <p className="text-xs font-semibold uppercase tracking-[0.2em] text-crimson mb-2">Partners</p>
          <h2 className="font-display text-2xl md:text-3xl font-bold text-foreground">
            Our Corporate Sponsors
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
              className="group flex items-center justify-center mx-6 md:mx-10 h-16 md:h-20 min-w-[8rem]"
            >
              <SponsorLogo {...sponsor} />
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default SponsorsSection;
