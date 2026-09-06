import { useState } from "react";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { CheckCircle2, Mail } from "lucide-react";
import { subscribeToNewsletter } from "@/services/newsletter";

interface NewsletterSubscriptionProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
}

const NewsletterSubscription = ({ open, onOpenChange }: NewsletterSubscriptionProps) => {
  const [email, setEmail] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isSuccess, setIsSuccess] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      setError("Enter a valid email address");
      return;
    }

    setIsSubmitting(true);
    setError(null);
    try {
      await subscribeToNewsletter(email);
      setIsSuccess(true);
      setEmail("");
      setTimeout(() => {
        setIsSuccess(false);
        onOpenChange(false);
      }, 3000);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Could not subscribe. Please try again.");
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleClose = () => {
    if (!isSubmitting) {
      setIsSuccess(false);
      setError(null);
      setEmail("");
      onOpenChange(false);
    }
  };

  return (
    <Dialog open={open} onOpenChange={handleClose}>
      <DialogContent className="sm:max-w-md">
        {!isSuccess ? (
          <>
            <DialogHeader>
              <DialogTitle className="font-display text-2xl font-bold text-center">
                Subscribe to Our Newsletter
              </DialogTitle>
              <DialogDescription className="text-center pt-2">
                Stay informed with the latest insights on human-AI collaboration, workforce transformation, and strategic leadership in the algorithmic age.
              </DialogDescription>
            </DialogHeader>
            
            <form onSubmit={handleSubmit} className="space-y-4 pt-4">
              <div className="space-y-2">
                <label htmlFor="email" className="text-sm font-medium text-foreground">
                  Email Address
                </label>
                <div className="relative">
                  <Mail className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                  <Input
                    id="email"
                    type="email"
                    placeholder="your.email@example.com"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    className="pl-10"
                    required
                    disabled={isSubmitting}
                  />
                </div>
              </div>
              
              {error && <p className="text-sm text-crimson">{error}</p>}
              <Button
                type="submit"
                variant="accent"
                className="w-full"
                disabled={isSubmitting || !email}
              >
                {isSubmitting ? "Subscribing..." : "Subscribe"}
              </Button>
            </form>
          </>
        ) : (
          <div className="text-center py-8">
            <div className="flex justify-center mb-4">
              <div className="w-16 h-16 bg-crimson/10 rounded-full flex items-center justify-center">
                <CheckCircle2 className="w-10 h-10 text-crimson" />
              </div>
            </div>
            <DialogTitle className="font-display text-2xl font-bold mb-2">
              Thank You!
            </DialogTitle>
            <DialogDescription className="text-base pt-2">
              You've successfully subscribed to our newsletter. We'll send you the latest insights and updates.
            </DialogDescription>
          </div>
        )}
      </DialogContent>
    </Dialog>
  );
};

export default NewsletterSubscription;
