import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Mail } from "lucide-react";

const NewsletterSection = () => {
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
            Join 25,000+ executives receiving weekly insights on human-AI collaboration, 
            leadership strategies, and the future of work.
          </p>
          <form className="flex flex-col sm:flex-row gap-3 max-w-md mx-auto">
            <Input 
              type="email" 
              placeholder="Enter your email" 
              className="h-12 bg-background border-border"
            />
            <Button variant="accent" size="lg" className="shrink-0">
              Subscribe
            </Button>
          </form>
          <p className="text-xs text-muted-foreground mt-4">
            No spam. Unsubscribe anytime. Read our privacy policy.
          </p>
        </div>
      </div>
    </section>
  );
};

export default NewsletterSection;
