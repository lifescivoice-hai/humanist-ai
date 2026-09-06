import { useState } from "react";
import type { FormEvent } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Mail } from "lucide-react";
import { subscribeToNewsletter } from "@/services/newsletter";

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
    <section className="py-16 bg-secondary/50">
      <div className="section-container">
        <div className="max-w-2xl mx-auto text-center">
          <div className="w-16 h-16 rounded-full bg-crimson/10 flex items-center justify-center mx-auto mb-6">
            <Mail className="w-8 h-8 text-crimson" />
          </div>
          <h2 className="font-display text-3xl md:text-4xl font-bold text-foreground mb-4">
            Stay Ahead of the Curve
          </h2>
          <p className="text-muted-foreground mb-8">
            Join 5,000+ executives receiving weekly insights on human-AI collaboration, 
            leadership strategies, and the future of work.
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
      </div>
    </section>
  );
};

export default NewsletterSection;
