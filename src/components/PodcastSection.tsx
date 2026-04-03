import podcastThumbnail from "@/assets/podcast-thumbnail.jpg";
import { Button } from "@/components/ui/button";
import { Headphones, Play, Clock } from "lucide-react";

const PodcastSection = () => {
  const episodes = [
    {
      number: 45,
      title: "Redefining Leadership in the Age of AI",
      guest: "Dr. Sarah Chen, MIT Sloan",
      duration: "52 min",
    },
    {
      number: 44,
      title: "The Ethics of Algorithmic Decision-Making",
      guest: "Marcus Williams, Former Google Ethics Lead",
      duration: "48 min",
    },
    {
      number: 43,
      title: "Building Resilient Organizations",
      guest: "Elena Rodriguez, McKinsey Partner",
      duration: "55 min",
    },
  ];

  return (
    <section className="py-16 bg-secondary/30">
      <div className="section-container">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          {/* Podcast Info */}
          <div>
            <div className="flex items-center gap-2 mb-4">
              <div className="p-2 rounded-lg bg-navy">
                <Headphones className="w-4 h-4 text-white" />
              </div>
              <span className="text-navy font-medium text-sm uppercase tracking-wider">
                The Humanist AI Podcast
              </span>
            </div>
            <h2 className="font-display text-3xl md:text-4xl font-bold text-foreground mb-4">
              Conversations at the Human-AI Frontier
            </h2>
            <p className="text-muted-foreground mb-8">
              In-depth dialogues with industry leaders, researchers, and visionaries exploring what it means to thrive alongside artificial intelligence.
            </p>

            {/* Episode List */}
            <div className="space-y-3 mb-8">
              {episodes.map((episode) => (
                <div 
                  key={episode.number}
                  className="flex items-center gap-4 p-4 rounded-xl bg-white border border-border hover:border-navy/30 hover:shadow-md transition-all cursor-pointer group"
                >
                  <div className="w-12 h-12 rounded-full bg-navy flex items-center justify-center group-hover:bg-crimson transition-colors">
                    <Play className="w-4 h-4 text-white ml-0.5" />
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-xs text-navy font-medium mb-1">EP. {episode.number}</p>
                    <h4 className="font-medium text-foreground truncate group-hover:text-navy transition-colors">{episode.title}</h4>
                    <p className="text-sm text-muted-foreground truncate">{episode.guest}</p>
                  </div>
                  <div className="flex items-center gap-1 text-xs text-muted-foreground">
                    <Clock className="w-3 h-3" />
                    {episode.duration}
                  </div>
                </div>
              ))}
            </div>

            <Button className="bg-navy hover:bg-navy/90 text-white" size="lg">
              <Headphones className="w-4 h-4" />
              Subscribe to Podcast
            </Button>
          </div>

          {/* Podcast Image */}
          <div className="relative">
            <div className="rounded-2xl overflow-hidden shadow-xl ring-4 ring-navy/10">
              <img 
                src={podcastThumbnail} 
                alt="The Humanist AI Podcast" 
                className="w-full aspect-[4/3] object-cover"
              />
            </div>
            <div className="absolute -bottom-6 -left-6 w-32 h-32 bg-navy rounded-2xl flex items-center justify-center shadow-lg">
              <div className="text-center text-white">
                <p className="text-3xl font-bold font-display">45+</p>
                <p className="text-xs uppercase tracking-wider opacity-80">Episodes</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default PodcastSection;
