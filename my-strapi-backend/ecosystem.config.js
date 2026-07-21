module.exports = {
  apps: [
    {
      name: "strapi",
      cwd: "/root/humanist-ai/my-strapi-backend",
      script: "npm",
      args: "run start",
      env: {
        NODE_ENV: "production",

        HOST: "127.0.0.1",
        PORT: 1338,

        DATABASE_CLIENT: "mysql",
        DATABASE_HOST: "127.0.0.1",
        DATABASE_PORT: 3306,
        DATABASE_NAME: "strapi_prod",
        DATABASE_USERNAME: "strapi",
        DATABASE_PASSWORD: "#AlphaBravoCharlie123!",
      },
    },
  ],
};
