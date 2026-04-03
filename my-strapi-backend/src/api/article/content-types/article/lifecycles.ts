type LifecycleEvent = {
  params: {
    data?: {
      title?: string;
      slug?: string;
      [key: string]: unknown;
    };
  };
};

const toSlug = (value: string): string => {
  return value
    .toLowerCase()
    .trim()
    .replace(/['"]/g, "")
    .replace(/[^a-z0-9._~\s-]/g, "")
    .replace(/\s+/g, "-")
    .replace(/-+/g, "-");
};

const normalizeSlug = (event: LifecycleEvent) => {
  const data = event.params.data;
  if (!data) return;

  const source = typeof data.slug === "string" && data.slug.trim() ? data.slug : data.title;
  if (!source || typeof source !== "string") return;

  data.slug = toSlug(source);
};

export default {
  beforeCreate(event: LifecycleEvent) {
    normalizeSlug(event);
  },
  beforeUpdate(event: LifecycleEvent) {
    normalizeSlug(event);
  },
};

