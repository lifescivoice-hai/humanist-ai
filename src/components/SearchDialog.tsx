import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { Search, X, Clock, User, FileQuestion, Loader2 } from "lucide-react";

import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
} from "@/components/ui/dialog";
import { Badge } from "@/components/ui/badge";
import { Skeleton } from "@/components/ui/skeleton";
import { useSearchArticles } from "@/hooks/useArticles";

interface SearchDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
}

const SearchDialog = ({ open, onOpenChange }: SearchDialogProps) => {
  const [query, setQuery] = useState("");
  const {
    data: results,
    isFetching,
    isError,
    error,
    debouncedQuery,
  } = useSearchArticles(query);

  // Reset the search every time the dialog is reopened.
  useEffect(() => {
    if (open) setQuery("");
  }, [open]);

  const trimmed = debouncedQuery;
  const tooShort = query.trim().length > 0 && query.trim().length < 2;
  const hasResults = !!results && results.length > 0;
  const showEmptyState = !!trimmed && !isFetching && results && results.length === 0;

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-w-2xl p-0 gap-0 overflow-hidden">
        <DialogHeader className="sr-only">
          <DialogTitle>Search articles</DialogTitle>
          <DialogDescription>Search articles by title, excerpt, or author.</DialogDescription>
        </DialogHeader>

        {/* Search input */}
        <div className="flex items-center gap-3 px-4 py-3 border-b border-border">
          <Search className="w-5 h-5 text-muted-foreground shrink-0" aria-hidden />
          <input
            type="text"
            autoFocus
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Search articles by title, keyword, or author…"
            className="flex-1 bg-transparent text-base outline-none placeholder:text-muted-foreground"
            aria-label="Search articles"
          />
          {query && (
            <button
              type="button"
              onClick={() => setQuery("")}
              className="p-1 rounded hover:bg-muted text-muted-foreground"
              aria-label="Clear search"
            >
              <X className="w-4 h-4" />
            </button>
          )}
        </div>

        {/* Results */}
        <div className="max-h-[60vh] overflow-y-auto">
          {!trimmed && !tooShort && (
            <div className="px-4 py-10 text-center text-sm text-muted-foreground">
              Start typing to search articles.
            </div>
          )}

          {tooShort && (
            <div className="px-4 py-10 text-center text-sm text-muted-foreground">
              Type at least 2 characters to search.
            </div>
          )}

          {isFetching && trimmed && (
            <div className="px-4 py-3 space-y-3">
              <div className="flex items-center gap-2 text-xs text-muted-foreground">
                <Loader2 className="w-3.5 h-3.5 animate-spin" />
                Searching…
              </div>
              {[0, 1, 2].map((i) => (
                <Skeleton key={i} className="h-16 rounded-lg" />
              ))}
            </div>
          )}

          {isError && (
            <div className="px-4 py-10 text-center text-sm text-destructive">
              {error instanceof Error ? error.message : "Search failed. Please try again."}
            </div>
          )}

          {showEmptyState && (
            <div className="px-4 py-10 text-center text-sm text-muted-foreground flex flex-col items-center gap-2">
              <FileQuestion className="w-6 h-6" />
              <span>
                No articles found for <strong className="text-foreground">"{trimmed}"</strong>.
              </span>
            </div>
          )}

          {hasResults && (
            <ul className="divide-y divide-border" role="listbox">
              {results!.map((article) => (
                <li key={article.id}>
                  <Link
                    to={`/articles/${article.slug}`}
                    onClick={() => onOpenChange(false)}
                    className="flex items-start gap-3 px-4 py-3 hover:bg-muted/60 focus:bg-muted/60 focus:outline-none transition-colors"
                  >
                    {article.featuredImage ? (
                      <img
                        src={article.featuredImage}
                        alt=""
                        className="w-14 h-14 object-cover rounded-md shrink-0"
                        loading="lazy"
                      />
                    ) : (
                      <div className="w-14 h-14 rounded-md bg-muted shrink-0" aria-hidden />
                    )}
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2 mb-1">
                        {article.category && (
                          <Badge variant="outline" className="text-crimson border-crimson/30 text-[10px]">
                            {article.category}
                          </Badge>
                        )}
                        {article.date && (
                          <span className="text-xs text-muted-foreground">{article.date}</span>
                        )}
                      </div>
                      <h3 className="font-display font-semibold text-sm text-foreground line-clamp-1">
                        {article.title}
                      </h3>
                      {article.excerpt && (
                        <p className="text-xs text-muted-foreground line-clamp-1 mt-0.5">
                          {article.excerpt}
                        </p>
                      )}
                      <div className="flex items-center gap-3 text-[11px] text-muted-foreground mt-1">
                        {article.author && (
                          <span className="flex items-center gap-1">
                            <User className="w-3 h-3" />
                            {article.author}
                          </span>
                        )}
                        {article.readTime && (
                          <span className="flex items-center gap-1">
                            <Clock className="w-3 h-3" />
                            {article.readTime}
                          </span>
                        )}
                      </div>
                    </div>
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </div>

        {hasResults && (
          <div className="px-4 py-2 text-[11px] text-muted-foreground border-t border-border bg-muted/30">
            {results!.length} result{results!.length === 1 ? "" : "s"} for "{trimmed}"
          </div>
        )}
      </DialogContent>
    </Dialog>
  );
};

export default SearchDialog;
