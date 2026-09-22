import type { ReactNode } from "react";
import { cn } from "@/lib/utils";

interface SectionHeaderProps {
  kicker?: string;
  title: string;
  description?: string;
  action?: ReactNode;
  invert?: boolean;
  className?: string;
}

const SectionHeader = ({
  kicker,
  title,
  description,
  action,
  invert = false,
  className,
}: SectionHeaderProps) => (
  <div
    className={cn(
      "flex items-end justify-between gap-4 flex-wrap mb-10",
      className
    )}
  >
    <div className="min-w-0 max-w-2xl">
      {kicker ? <p className={cn("section-kicker", invert && "text-crimson-light")}>{kicker}</p> : null}
      <h2
        className={cn(
          "font-display text-3xl md:text-4xl font-semibold tracking-tight",
          invert ? "text-white" : "text-foreground"
        )}
      >
        {title}
      </h2>
      {description ? (
        <p className={cn("mt-2 text-[15px] leading-relaxed", invert ? "text-white/65" : "text-muted-foreground")}>
          {description}
        </p>
      ) : null}
    </div>
    {action}
  </div>
);

export default SectionHeader;
