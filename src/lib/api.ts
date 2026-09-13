// Strapi API base URL (set VITE_STRAPI_URL in .env — see .env.example)
const STRAPI_URL = import.meta.env.VITE_STRAPI_URL || 'https://api.thehumanistai.com';

export const API_URL = `${STRAPI_URL}/api`;

// Helper to get full image URL from Strapi
export const getStrapiImageUrl = (image: any): string | null => {
  if (!image) return null;
  
  console.log('Processing image:', image);
  
  // Handle Strapi v5 - when populated, image might be an object with url directly
  // Structure: { url: "/uploads/...", alternativeText: "...", ... }
  if (image.url) {
    const url = image.url;
    if (url.startsWith('http')) return url;
    // Strapi URLs typically start with /uploads/
    return `${STRAPI_URL}${url}`;
  }
  
  // Handle nested data structure (v4 and some v5 cases)
  if (image.data) {
    // Strapi v4: image.data.attributes.url
    if (image.data.attributes?.url) {
      const url = image.data.attributes.url;
      if (url.startsWith('http')) return url;
      return `${STRAPI_URL}${url}`;
    }
    
    // Strapi v5: image.data.url (when data is the media object)
    if (image.data.url) {
      const url = image.data.url;
      if (url.startsWith('http')) return url;
      return `${STRAPI_URL}${url}`;
    }
    
    // Handle if data is an array (multiple images) - take first one
    if (Array.isArray(image.data) && image.data.length > 0) {
      const firstImage = image.data[0];
      if (firstImage.url) {
        const url = firstImage.url;
        if (url.startsWith('http')) return url;
        return `${STRAPI_URL}${url}`;
      }
      if (firstImage.attributes?.url) {
        const url = firstImage.attributes.url;
        if (url.startsWith('http')) return url;
        return `${STRAPI_URL}${url}`;
      }
    }
  }
  
  console.warn('Could not extract image URL from:', image);
  return null;
};

// Helper to format Strapi date
export const formatStrapiDate = (dateString: string): string => {
  if (!dateString) return '';

  // Date-only fields (YYYY-MM-DD) must be parsed as local calendar dates.
  // `new Date('2026-08-31')` is UTC midnight and can shift a day in some timezones.
  const dateOnly = /^(\d{4})-(\d{2})-(\d{2})$/.exec(dateString);
  const date = dateOnly
    ? new Date(Number(dateOnly[1]), Number(dateOnly[2]) - 1, Number(dateOnly[3]))
    : new Date(dateString);

  if (Number.isNaN(date.getTime())) return '';

  return date.toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
  });
};
