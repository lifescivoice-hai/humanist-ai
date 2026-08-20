import { Link } from "react-router-dom";
import logo from "@/assets/logo.png";
import { Button } from "@/components/ui/button";
import { Menu, X, Search } from "lucide-react";
import { useEffect, useState } from "react";
import NewsletterSubscription from "@/components/NewsletterSubscription";
import SearchDialog from "@/components/SearchDialog";
import { useMenuItems } from "@/hooks/useArticles";

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [isSubscriptionOpen, setIsSubscriptionOpen] = useState(false);
  const [isSearchOpen, setIsSearchOpen] = useState(false);

  // Keyboard shortcut: Ctrl/Cmd + K opens the search dialog.
  useEffect(() => {
    const onKeyDown = (e: KeyboardEvent) => {
      if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === "k") {
        e.preventDefault();
        setIsSearchOpen((prev) => !prev);
      }
    };
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, []);

  const fallbackNavItems = [
    { label: "Blogs", href: "/blogs" },
    { label: "Articles", href: "/articles" },
    { label: "About", href: "/about" },
  ];
  const { data: menuItems, isPending: isMenuPending } = useMenuItems("header");
  const hiddenPaths = new Set(["/podcast", "/events", "/awards", "/workshops", "/webinars"]);
  const navItems =
    menuItems != null
      ? menuItems
          .map((item) => ({ label: item.label, href: item.path }))
          .filter((item) => !hiddenPaths.has(item.href.replace(/\/$/, "") || "/"))
      : [];
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

          <div className="hidden md:flex items-center gap-2">
            <button
              type="button"
              onClick={() => setIsSearchOpen(true)}
              aria-label="Search articles"
              className="p-2 rounded-md text-muted-foreground hover:text-foreground hover:bg-muted transition-colors"
            >
              <Search className="h-5 w-5" />
            </button>
            <Button
              variant="accent"
              size="sm"
              onClick={() => setIsSubscriptionOpen(true)}
            >
              Subscribe
            </Button>
          </div>

          {/* Mobile actions */}
          <div className="flex md:hidden items-center gap-1">
            <button
              type="button"
              onClick={() => setIsSearchOpen(true)}
              aria-label="Search articles"
              className="p-2 text-muted-foreground hover:text-foreground"
            >
              <Search className="h-5 w-5" />
            </button>
            <button
              className="p-2"
              onClick={() => setIsMenuOpen(!isMenuOpen)}
              aria-label="Toggle menu"
            >
              {isMenuOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
            </button>
          </div>
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

      <SearchDialog open={isSearchOpen} onOpenChange={setIsSearchOpen} />
    </header>
  );
};

export default Header;
