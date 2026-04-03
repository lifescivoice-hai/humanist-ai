import Header from "@/components/Header";
import HeroSection from "@/components/HeroSection";
import FeaturedBlogs from "@/components/FeaturedBlogs";
import FeaturedArticles from "@/components/FeaturedArticles";
import TopNewsSection from "@/components/TopNewsSection";
import PodcastSection from "@/components/PodcastSection";
import EventsSection from "@/components/EventsSection";
import PublishedNewsletters from "@/components/PublishedNewsletters";
import NewsletterSection from "@/components/NewsletterSection";
import Footer from "@/components/Footer";
import AdPlaceholder from "@/components/AdPlaceholder";

const Index = () => {
  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      
      <main className="flex-1">
        <HeroSection />
        
        {/* Leaderboard Ad after Hero */}
        <div className="py-6 flex justify-center bg-background">
          <AdPlaceholder size="leaderboard" />
        </div>

        <FeaturedBlogs />

        {/* Inline Ad between sections */}
        <div className="py-6 flex justify-center bg-background">
          <AdPlaceholder size="banner" />
        </div>

        <FeaturedArticles />

        <TopNewsSection />

        {/* Leaderboard Ad */}
        <div className="py-6 flex justify-center bg-background">
          <AdPlaceholder size="leaderboard" />
        </div>

        <PodcastSection />

        <EventsSection />

        <PublishedNewsletters />

        {/* Inline Ad before Newsletter signup */}
        <div className="py-6 flex justify-center bg-secondary/30">
          <AdPlaceholder size="banner" />
        </div>
        
        <NewsletterSection />
      </main>

      <Footer />
    </div>
  );
};

export default Index;
