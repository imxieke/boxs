const server = Bun.serve({
  port: 16888,
  routes:{
    "/": new Response("Hello, world!"),
    "/api": Response.json({ message: "Hello, world!" }),
    "/user/:id": (req) => new Response(`Hello, ${req.params.id}!`),
    "/favicon.ico": Bun.file("./favicon.ico")
  },
  fetch (req, server) {
    const url = new URL(req.url);
    const path = url.pathname;
    const ip = server.requestIP(req);
    return new Response("Not found!", { status: 404 });
  },
  development: process.env.NODE_ENV !== "production" && {
    // Enable browser hot reloading in development
    hmr: true,

    // Echo console logs from the browser to the server
    console: true,
  },
});

console.log(`🚀 Server running at ${server.url}`);