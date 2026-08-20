import logo from "@/assets/logo.png";
import { Link } from "react-router-dom";
import { Linkedin, Twitter, Youtube, Instagram } from "lucide-react";

const Footer = () => {
  const footerLinks = {
    content: [
      { label: "Blogs", href: "/blogs" },
      { label: "Articles", href: "/articles" },
      { label: "Newsletters", href: "/newsletters" },
    ],
    company: [
      { label: "About Us", href: "/about" },
      { label: "Team", href: "/team" },
      { label: "Careers", href: "/careers" },
      { label: "Contact", href: "/contact" },
    ],
    legal: [
      { label: "Privacy Policy", href: "/privacy" },
      { label: "Terms of Service", href: "/terms" },
      { label: "Cookie Policy", href: "/cookies" },
    ],
  };

  const socialLinks = [
    { icon: Linkedin, href: "https://linkedin.com", label: "LinkedIn" },
    { icon: Twitter, href: "https://twitter.com", label: "Twitter" },
    { icon: Youtube, href: "https://youtube.com", label: "YouTube" },
    { icon: Instagram, href: "https://instagram.com", label: "Instagram" },
  ];

  return (
    <footer className="bg-navy text-primary-foreground">
      <div className="section-container py-16">
        <div className="grid grid-cols-2 md:grid-cols-5 gap-8">
          {/* Brand */}
          <div className="col-span-2">
            <img src={logo} alt="The Humanist AI" className="h-8 mb-4 brightness-0 invert" />
            <div className="text-primary-foreground/70 text-sm mb-6 max-w-md space-y-3">
              <p>
                The Humanist AI is a premier digital resource dedicated to the critical challenge of the algorithmic age: how to preserve human relevance in a rapidly evolving economy.
              </p>
              <p>
                We synthesize global research, market news, and strategic insights to help leaders understand the shifting value of human capital and how to align it with the power of artificial intelligence.
              </p>
            </div>
            <div className="flex gap-4">
              {socialLinks.map((social) => (
                <a
                  key={social.label}
                  href={social.href}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="w-10 h-10 rounded-full bg-primary-foreground/10 flex items-center justify-center hover:bg-crimson transition-colors"
                  aria-label={social.label}
                >
                  <social.icon className="w-4 h-4" />
                </a>
              ))}
            </div>
          </div>

          {/* Content */}
          <div>
            <h4 className="font-semibold mb-4">Content</h4>
            <ul className="space-y-2">
              {footerLinks.content.map((link) => (
                <li key={link.href}>
                  <Link 
                    to={link.href} 
                    className="text-sm text-primary-foreground/70 hover:text-primary-foreground transition-colors"
                  >
                    {link.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Company */}
          <div>
            <h4 className="font-semibold mb-4">Company</h4>
            <ul className="space-y-2">
              {footerLinks.company.map((link) => (
                <li key={link.href}>
                  <Link 
                    to={link.href} 
                    className="text-sm text-primary-foreground/70 hover:text-primary-foreground transition-colors"
                  >
                    {link.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Legal */}
          <div>
            <h4 className="font-semibold mb-4">Legal</h4>
            <ul className="space-y-2">
              {footerLinks.legal.map((link) => (
                <li key={link.href}>
                  <Link 
                    to={link.href} 
                    className="text-sm text-primary-foreground/70 hover:text-primary-foreground transition-colors"
                  >
                    {link.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        </div>

        <div className="border-t border-primary-foreground/10 mt-12 pt-8 flex flex-col md:flex-row items-center justify-between gap-4">
          <p className="text-sm text-primary-foreground/60">
            © 2026 The Humanist AI. All rights reserved.
          </p>
          <p className="text-sm text-primary-foreground/60">
            Made with purpose for the human-AI future.
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
