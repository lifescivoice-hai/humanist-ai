import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { Badge } from "@/components/ui/badge";
import { Separator } from "@/components/ui/separator";
import founderImage from "@/assets/founder.jpg";

const About = () => {
  return (
    <div className="min-h-screen flex flex-col">
      <Header />

      <main className="flex-1">
        {/* Hero Section */}
        <section className="bg-navy text-primary-foreground">
          <div className="section-container py-12 md:py-16 lg:py-20">
            <div className="max-w-4xl mx-auto text-center">
              <Badge className="bg-crimson text-white border-none mb-6">
                About Us
              </Badge>
              <h1 className="font-display text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
                The Humanist AI
              </h1>
              <p className="text-lg md:text-xl text-primary-foreground/80 leading-relaxed">
                Preserving Human Relevance in the Algorithmic Age
              </p>
            </div>
          </div>
        </section>

        {/* Mission Section */}
        <section className="bg-background py-12 md:py-16 lg:py-20">
          <div className="section-container">
            <div className="max-w-4xl mx-auto">
              <h2 className="font-display text-3xl md:text-4xl font-bold text-foreground mb-6">
                Our Mission
              </h2>
              <div className="prose prose-lg max-w-none prose-headings:font-display prose-p:text-muted-foreground prose-p:leading-relaxed prose-p:text-base md:prose-p:text-lg">
                <p className="text-muted-foreground leading-relaxed">
                  The Humanist AI is a premier digital resource dedicated to the critical challenge of the algorithmic age: how to preserve human relevance in a rapidly evolving economy. We synthesize global research, market news, and strategic insights to help leaders understand the shifting value of human capital and how to align it with the power of artificial intelligence.
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* Founder's Note Section */}
        <section className="bg-secondary/30 py-12 md:py-16 lg:py-20">
          <div className="section-container">
            <div className="max-w-4xl mx-auto">
              <Badge variant="outline" className="mb-6 border-crimson/50 text-crimson">
                A Note from the Founder
              </Badge>
              <h2 className="font-display text-3xl md:text-4xl font-bold text-foreground mb-8">
                Letter from the Editor: The Case for Human Relevance in the Algorithmic Age
              </h2>
              
              <div className="prose prose-lg max-w-none prose-headings:font-display prose-p:text-muted-foreground prose-p:leading-relaxed prose-p:text-base md:prose-p:text-lg space-y-6">
                <p className="text-muted-foreground leading-relaxed">
                  The current conversation around Artificial Intelligence is dominated by technical benchmarks. We measure progress in parameters, token speeds, and compute power. We ask, "What can the model do?"
                </p>
                
                <p className="text-muted-foreground leading-relaxed">
                  But in boardrooms, strategy sessions, and policy meetings, the questions are shifting. The focus is moving from the capability of the machine to the consequence for the individual. Leaders are no longer just asking about efficiency; they are asking about relevance.
                </p>

                <div className="my-8 space-y-4">
                  <p className="text-foreground font-semibold text-lg">
                    What happens to the value of human judgment when intelligence becomes a commodity?
                  </p>
                  <p className="text-foreground font-semibold text-lg">
                    How do we restructure the workforce without eroding the social fabric of the organization?
                  </p>
                  <p className="text-foreground font-semibold text-lg">
                    How do we integrate synthetic intelligence while preserving human agency?
                  </p>
                </div>

                <p className="text-muted-foreground leading-relaxed">
                  This is no longer just a computer science challenge. It is a sociological and economic one.
                </p>

                <p className="text-muted-foreground leading-relaxed">
                  We are witnessing the greatest friction point between code and culture since the dawn of the internet. The leaders who survive this shift will not be the ones who merely adopt the fastest tools, but the ones who understand how to align those tools with human potential.
                </p>

                <div className="bg-card border-l-4 border-l-crimson p-6 md:p-8 rounded-r-lg shadow-card my-8">
                  <h3 className="font-display text-2xl font-bold text-foreground mb-4">
                    Welcome to The Humanist AI.
                  </h3>
                  <p className="text-muted-foreground leading-relaxed mb-4">
                    We are a premier digital resource dedicated to a single, critical mission: preserving human relevance in a rapidly evolving economy.
                  </p>
                  <p className="text-muted-foreground leading-relaxed mb-4">
                    We do not chase the hype cycle. We are not here to review the latest chatbots or re-post press releases. Instead, we synthesize global research, labor market data, and strategic insights to separate the signal from the noise.
                  </p>
                  <p className="text-muted-foreground leading-relaxed mb-4">
                    Our mandate is to act as a bridge. We connect the "hard" data of technological progress with the "soft" realities of sociology and economics. We analyze the Human Layer of the tech stack.
                  </p>
                  <p className="text-muted-foreground leading-relaxed">
                    Whether you are a CEO navigating workforce transformation, an investor looking for sustainable value, or a leader trying to understand the future of work, our goal is to provide you with the intelligence needed to navigate the algorithmic age with confidence.
                  </p>
                </div>

                <p className="text-foreground font-semibold text-lg md:text-xl italic">
                  Technology is inevitable. Human relevance is not—it must be architected.
                </p>

                <p className="text-muted-foreground leading-relaxed text-lg">
                  Welcome to the conversation.
                </p>
              </div>
            </div>
          </div>
        </section>

        {/* Methodology Section */}
        <section className="bg-background py-12 md:py-16 lg:py-20">
          <div className="section-container">
            <div className="max-w-4xl mx-auto">
              <h2 className="font-display text-3xl md:text-4xl font-bold text-foreground mb-6">
                Our Methodology
              </h2>
              <p className="text-lg text-muted-foreground mb-8">
                How We Work: Unlike general tech news, we use a three-pillared approach to analyze the market:
              </p>

              <div className="grid grid-cols-1 md:grid-cols-3 gap-6 md:gap-8">
                <div className="bg-card border border-border rounded-xl p-6 shadow-card hover:shadow-hover transition-shadow">
                  <div className="w-12 h-12 bg-crimson/10 rounded-lg flex items-center justify-center mb-4">
                    <span className="text-2xl font-bold text-crimson">1</span>
                  </div>
                  <h3 className="font-display text-xl font-semibold text-foreground mb-3">
                    Sociological Impact
                  </h3>
                  <p className="text-muted-foreground leading-relaxed">
                    Tracking workforce sentiment and cultural shifts.
                  </p>
                </div>

                <div className="bg-card border border-border rounded-xl p-6 shadow-card hover:shadow-hover transition-shadow">
                  <div className="w-12 h-12 bg-crimson/10 rounded-lg flex items-center justify-center mb-4">
                    <span className="text-2xl font-bold text-crimson">2</span>
                  </div>
                  <h3 className="font-display text-xl font-semibold text-foreground mb-3">
                    Economic Indicators
                  </h3>
                  <p className="text-muted-foreground leading-relaxed">
                    Analyzing labor data and value displacement.
                  </p>
                </div>

                <div className="bg-card border border-border rounded-xl p-6 shadow-card hover:shadow-hover transition-shadow">
                  <div className="w-12 h-12 bg-crimson/10 rounded-lg flex items-center justify-center mb-4">
                    <span className="text-2xl font-bold text-crimson">3</span>
                  </div>
                  <h3 className="font-display text-xl font-semibold text-foreground mb-3">
                    Technical Reality
                  </h3>
                  <p className="text-muted-foreground leading-relaxed">
                    Separating AI capabilities from marketing hype.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Founder Section */}
        <section className="bg-background py-12 md:py-16 lg:py-20">
          <div className="section-container">
            <div className="max-w-5xl mx-auto">
              <Separator className="bg-border mb-12" />
              
              <div className="grid grid-cols-1 md:grid-cols-2 gap-8 md:gap-12 items-center">
                {/* Founder Image */}
                <div className="flex justify-center md:justify-start">
                  <div className="relative">
                    <div className="absolute -inset-4 bg-gradient-to-br from-crimson/20 to-navy/20 rounded-2xl blur-xl"></div>
                    <div className="relative rounded-2xl overflow-hidden shadow-2xl border-4 border-white">
                      <img 
                        src={founderImage} 
                        alt="Anakh Sawhney, Founder & Editor-in-Chief" 
                        className="w-full max-w-sm h-auto object-cover"
                      />
                    </div>
                  </div>
                </div>

                {/* Founder Info */}
                <div className="text-center md:text-left space-y-4">
                  <Badge className="bg-crimson text-white border-none mb-2">
                    Founder
                  </Badge>
                  <h2 className="font-display text-3xl md:text-4xl lg:text-5xl font-bold text-foreground">
                    Anakh Sawhney
                  </h2>
                  <p className="text-xl md:text-2xl text-muted-foreground font-medium">
                    Founder & Editor-in-Chief
                  </p>
                  <div className="pt-4 border-t border-border">
                    <p className="text-muted-foreground leading-relaxed">
                      Leading The Humanist AI's mission to preserve human relevance in the algorithmic age through strategic insights, research synthesis, and thoughtful analysis of the intersection between technology and human capital.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>

      <Footer />
    </div>
  );
};

export default About;
