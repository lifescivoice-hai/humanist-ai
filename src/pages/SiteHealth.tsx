/** Client-side route for /site/health (direct GET is served as static JSON from public/site/health). */
const SiteHealth = () => (
  <pre className="m-0 p-4 font-mono text-sm">
    {JSON.stringify({ message: "healthy" })}
  </pre>
);

export default SiteHealth;
