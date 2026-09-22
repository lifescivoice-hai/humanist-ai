import { useState } from "react";
import type { FormEvent } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Mail } from "lucide-react";
import { subscribeToNewsletter } from "@/services/newsletter";
import BorderGlow, { BRAND_GLOW_COLORS } from "@/components/BorderGlow";

const NewsletterSection = () => {
  const [email, setEmail] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isSuccess, setIsSuccess] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const onSubmit = async (event: FormEvent) => {
    event.preventDefault();
    setError(null);
    setIsSuccess(false);
    setIsSubmitting(true);
    try {
      await subscribeToNewsletter(email);
      setIsSuccess(true);
      setEmail("");
    } catch (err) {
      setError(err instanceof Error ? err.message : "Could not subscribe. Please try again.");
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <section className="py-16 md:py-20 bg-secondary/50 border-t border-border">
      <div className="section-container">
        <BorderGlow
          className="max-w-2xl mx-auto"
          glowColor="228 58 42"
          backgroundColor="#ffffff"
          colors={[...BRAND_GLOW_COLORS]}
          borderRadius={20}
          glowRadius={28}
          glowIntensity={1}
          coneSpread={22}
          edgeSensitivity={22}
          fillOpacity={0.28}
        >
          <div className="px-6 py-10 md:px-10 text-center">
            <Mail className="w-6 h-6 text-crimson mx-auto mb-5" />
            <p className="section-kicker">The Dispatch</p>
            <h2 className="font-display text-3xl md:text-4xl font-semibold text-foreground mb-4">
              Briefing for the week ahead
            </h2>
            <p className="text-muted-foreground mb-8 leading-relaxed">
              Research, market news, and argument — for leaders who still have to decide what remains human.
            </p>
            <form onSubmit={onSubmit} className="flex flex-col sm:flex-row gap-3 max-w-md mx-auto">
              <Input
                type="email"
                placeholder="Enter your email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="h-12 bg-background border-border"
                required
                disabled={isSubmitting}
              />
              <Button type="submit" variant="accent" size="lg" className="shrink-0" disabled={isSubmitting || !email}>
                {isSubmitting ? "Subscribing..." : "Subscribe"}
              </Button>
            </form>
            {error && <p className="text-sm text-crimson mt-3">{error}</p>}
            {isSuccess && (
              <p className="text-sm text-foreground mt-3">You are subscribed. Thank you.</p>
            )}
            <p className="text-xs text-muted-foreground mt-4">
              No spam. Unsubscribe anytime. Read our privacy policy.
            </p>
          </div>
        </BorderGlow>
      </div>
    </section>
  );
};

export default NewsletterSection;
