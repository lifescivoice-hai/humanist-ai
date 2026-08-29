import Header from "@/components/Header";
import HeroSection from "@/components/HeroSection";
import SponsorsSection from "@/components/SponsorsSection";
import FeaturedBlogs from "@/components/FeaturedBlogs";
import FeaturedArticles from "@/components/FeaturedArticles";
import TopNewsSection from "@/components/TopNewsSection";
import PublishedNewsletters from "@/components/PublishedNewsletters";
import NewsletterSection from "@/components/NewsletterSection";
import Footer from "@/components/Footer";

const Index = () => {
  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      
      <main className="flex-1">
        <HeroSection />

        <SponsorsSection />

        <FeaturedBlogs />

        <FeaturedArticles />

        <TopNewsSection />

        <PublishedNewsletters />
        
        <NewsletterSection />
      </main>

      <Footer />
    </div>
  );
};

export default Index;
