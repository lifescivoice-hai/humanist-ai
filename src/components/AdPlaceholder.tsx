interface AdPlaceholderProps {
  size: "leaderboard" | "rectangle" | "skyscraper" | "banner";
  className?: string;
}

const AdPlaceholder = ({ size, className = "" }: AdPlaceholderProps) => {
  const sizeClasses = {
    leaderboard: "h-[90px] w-full max-w-[728px]",
    rectangle: "h-[250px] w-[300px]",
    skyscraper: "h-[600px] w-[160px]",
    banner: "h-[60px] w-full max-w-[468px]",
  };

  const sizeLabels = {
    leaderboard: "728×90",
    rectangle: "300×250",
    skyscraper: "160×600",
    banner: "468×60",
  };

  return (
    <div className={`ad-placeholder ${sizeClasses[size]} ${className}`}>
      <div className="text-center">
        <p className="text-xs text-muted-foreground font-medium">Advertisement</p>
        <p className="text-xs text-muted-foreground/60">{sizeLabels[size]}</p>
      </div>
    </div>
  );
};

export default AdPlaceholder;
