import awardsThumbnail from "@/assets/awards-thumbnail.jpg";
import { Button } from "@/components/ui/button";
import { Trophy, Calendar, MapPin, Users } from "lucide-react";

const EventsSection = () => {
  return (
    <section className="py-16 bg-navy">
      <div className="section-container">
        <div className="text-center mb-12">
          <div className="flex items-center justify-center gap-2 mb-4">
            <Trophy className="w-5 h-5 text-crimson" />
            <span className="text-crimson font-medium text-sm uppercase tracking-wider">
              Events & Awards
            </span>
          </div>
          <h2 className="font-display text-3xl md:text-4xl font-bold text-primary-foreground mb-4">
            Celebrating Human Excellence in AI
          </h2>
          <p className="text-primary-foreground/70 max-w-2xl mx-auto">
            Join us at our flagship events where we recognize and connect the leaders shaping the future of human-AI collaboration.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Featured Event */}
          <div className="relative rounded-2xl overflow-hidden group">
            <img 
              src={awardsThumbnail} 
              alt="The Humanist AI Awards 2026" 
              className="w-full aspect-video object-cover group-hover:scale-105 transition-transform duration-500"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-navy via-navy/60 to-transparent" />
            <div className="absolute inset-0 p-8 flex flex-col justify-end">
              <div className="inline-flex items-center gap-2 bg-crimson text-accent-foreground px-3 py-1 rounded-full text-xs font-medium mb-4 w-fit">
                <Trophy className="w-3 h-3" />
                Flagship Event
              </div>
              <h3 className="font-display text-2xl md:text-3xl font-bold text-primary-foreground mb-2">
                The Humanist AI Awards 2026
              </h3>
              <p className="text-primary-foreground/80 mb-4">
                Honoring visionaries who are defining human-centric AI leadership
              </p>
              <div className="flex flex-wrap gap-4 text-sm text-primary-foreground/70 mb-6">
                <span className="flex items-center gap-1">
                  <Calendar className="w-4 h-4" />
                  March 15, 2026
                </span>
                <span className="flex items-center gap-1">
                  <MapPin className="w-4 h-4" />
                  New York City
                </span>
                <span className="flex items-center gap-1">
                  <Users className="w-4 h-4" />
                  500+ Attendees
                </span>
              </div>
              <Button variant="hero" className="w-fit">
                Register for Awards
              </Button>
            </div>
          </div>

          {/* Upcoming Events List */}
          <div className="flex flex-col gap-4">
            {[
              {
                title: "Executive AI Summit",
                date: "Feb 8, 2026",
                location: "Virtual",
                type: "Conference",
              },
              {
                title: "HR Leaders Roundtable",
                date: "Feb 22, 2026",
                location: "London",
                type: "Roundtable",
              },
              {
                title: "AI Ethics Workshop",
                date: "Mar 5, 2026",
                location: "San Francisco",
                type: "Workshop",
              },
            ].map((event, index) => (
              <div 
                key={index}
                className="p-6 rounded-xl bg-navy-light/50 border border-primary-foreground/10 hover:border-crimson/50 transition-colors group cursor-pointer"
              >
                <div className="flex items-start justify-between">
                  <div>
                    <span className="text-xs text-crimson font-medium uppercase tracking-wider">
                      {event.type}
                    </span>
                    <h4 className="font-display text-lg font-semibold text-primary-foreground mt-1 group-hover:text-crimson transition-colors">
                      {event.title}
                    </h4>
                    <div className="flex gap-4 mt-2 text-sm text-primary-foreground/60">
                      <span className="flex items-center gap-1">
                        <Calendar className="w-3 h-3" />
                        {event.date}
                      </span>
                      <span className="flex items-center gap-1">
                        <MapPin className="w-3 h-3" />
                        {event.location}
                      </span>
                    </div>
                  </div>
                  <Button variant="heroOutline" size="sm">
                    Learn More
                  </Button>
                </div>
              </div>
            ))}

            <Button variant="heroOutline" className="mt-2">
              View All Events →
            </Button>
          </div>
        </div>
      </div>
    </section>
  );
};

export default EventsSection;
