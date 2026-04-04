import { Link } from "react-router-dom";
import logo from "@/assets/logo.png";
import { Button } from "@/components/ui/button";
import { Menu, X } from "lucide-react";
import { useState } from "react";
import NewsletterSubscription from "@/components/NewsletterSubscription";
import { useMenuItems } from "@/hooks/useArticles";

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [isSubscriptionOpen, setIsSubscriptionOpen] = useState(false);

  const fallbackNavItems = [
    { label: "Blogs", href: "/blogs" },
    { label: "Articles", href: "/articles" },
    { label: "Podcast", href: "/podcast" },
    { label: "Events", href: "/events" },
    { label: "About", href: "/about" },
  ];
  const { data: menuItems, isPending: isMenuPending } = useMenuItems("header");
  const navItems =
    menuItems != null ? menuItems.map((item) => ({ label: item.label, href: item.path })) : [];
  // While the first fetch runs, show a skeleton — not the hardcoded fallback — to avoid a flash of wrong links.
  const resolvedNavItems = navItems.length > 0 ? navItems : fallbackNavItems;

  return (
    <header className="sticky top-0 z-50 w-full bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60 border-b border-border">
      <div className="section-container">
        <div className="flex h-16 items-center justify-between">
          <Link to="/" className="flex items-center">
            <img src={logo} alt="The Humanist AI" className="h-8 md:h-10" />
          </Link>

          {/* Desktop Navigation */}
          <nav
            className="hidden md:flex items-center gap-8"
            aria-busy={isMenuPending}
            aria-label="Main navigation"
          >
            {isMenuPending ? (
              <>
                {[0, 1, 2, 3, 4].map((i) => (
                  <span
                    key={i}
                    className="h-4 w-14 rounded bg-muted animate-pulse"
                    aria-hidden
                  />
                ))}
              </>
            ) : (
              resolvedNavItems.map((item) => (
                <Link
                  key={`${item.label}-${item.href}`}
                  to={item.href}
                  className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
                >
                  {item.label}
                </Link>
              ))
            )}
          </nav>

          <div className="hidden md:flex items-center gap-4">
            <Button 
              variant="accent" 
              size="sm"
              onClick={() => setIsSubscriptionOpen(true)}
            >
              Subscribe
            </Button>
          </div>

          {/* Mobile Menu Button */}
          <button
            className="md:hidden p-2"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
            aria-label="Toggle menu"
          >
            {isMenuOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
          </button>
        </div>

        {/* Mobile Navigation */}
        {isMenuOpen && (
          <nav className="md:hidden py-4 border-t border-border animate-fade-in">
            <div className="flex flex-col gap-4">
              {isMenuPending ? (
                <>
                  {[0, 1, 2, 3, 4].map((i) => (
                    <span
                      key={i}
                      className="h-4 w-28 rounded bg-muted animate-pulse"
                      aria-hidden
                    />
                  ))}
                </>
              ) : (
                resolvedNavItems.map((item) => (
                  <Link
                    key={`${item.label}-${item.href}`}
                    to={item.href}
                    className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
                    onClick={() => setIsMenuOpen(false)}
                  >
                    {item.label}
                  </Link>
                ))
              )}
              <Button 
                variant="accent" 
                size="sm" 
                className="w-fit"
                onClick={() => {
                  setIsSubscriptionOpen(true);
                  setIsMenuOpen(false);
                }}
              >
                Subscribe
              </Button>
            </div>
          </nav>
        )}
      </div>
      
      <NewsletterSubscription 
        open={isSubscriptionOpen} 
        onOpenChange={setIsSubscriptionOpen} 
      />
    </header>
  );
};

export default Header;
