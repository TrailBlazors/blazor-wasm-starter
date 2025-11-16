# Blazor WebAssembly Starter

**A production-ready Blazor WebAssembly (WASM) template for Railway deployment.**

Build client-side web applications that run entirely in the browser with C# and .NET 9. No server required after initial download - perfect for PWAs and offline-capable apps.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/TEMPLATE_ID)

## ✨ Features

- 🌐 **Client-Side** - Runs entirely in the browser via WebAssembly
- ⚡ **Blazor WASM** - Interactive C# apps without JavaScript
- 📱 **PWA Ready** - Offline support and installable apps
- 🚀 **Fast Loading** - Optimized with gzip compression
- 🐳 **nginx Optimized** - Lightweight static file serving
- 🎯 **.NET 9** - Latest WebAssembly features
- 💰 **Low Cost** - Static hosting is cheaper than server apps

## 🚀 Quick Start

### Deploy to Railway

Click the "Deploy on Railway" button above. Railway will:
- Build your WASM app using Docker
- Compile C# to WebAssembly
- Serve static files via nginx
- Generate a public URL

### Local Development
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/blazor-wasm-starter.git
cd blazor-wasm-starter/BlazorWasmStarter

# Run the application
dotnet run

# Or watch for changes
dotnet watch

# Open browser to https://localhost:5001
```

## 📁 Project Structure
```
blazor-wasm-starter/
├── BlazorWasmStarter/          # WASM application
│   ├── Pages/                  # Page components
│   ├── Shared/                 # Shared components
│   ├── wwwroot/                # Static assets
│   │   └── index.html         # Entry point
│   └── Program.cs             # App configuration
├── Dockerfile                  # Multi-stage Docker build
├── nginx.conf                  # nginx configuration
├── railway.toml                # Railway configuration
└── README.md                   # Documentation
```

## 🌐 Blazor WASM vs Server

**WebAssembly (This Template):**
- ✅ Runs in browser (client-side)
- ✅ Works offline after first load
- ✅ Lower server costs (static hosting)
- ✅ Better for public-facing apps
- ❌ Larger initial download
- ❌ Requires WebAssembly support

**Server:**
- ✅ Smaller initial download
- ✅ Better SEO
- ✅ No WebAssembly required
- ❌ Requires constant server connection
- ❌ Higher hosting costs

## 🛠️ Customization

### Add API Backend

Blazor WASM typically needs an API. Deploy a separate API service on Railway:
```bash
# Create API project
dotnet new webapi -n BlazorWasmApi

# Add to Railway as separate service
# Configure CORS to allow your WASM app
```

### Enable PWA Features

WASM apps can be Progressive Web Apps:
```bash
# Create with PWA template
dotnet new blazorwasm-pwa -n BlazorWasmStarter
```

### Add Authentication
```csharp
// Use external auth providers
// Auth0, Azure AD B2C, or custom API
```

## 📚 Learn More

- [Blazor WASM Docs](https://learn.microsoft.com/en-us/aspnet/core/blazor/hosting-models#blazor-webassembly)
- [.NET 9 WASM Features](https://learn.microsoft.com/en-us/dotnet/core/whats-new/dotnet-9)
- [Railway Documentation](https://docs.railway.app/)

## 🤝 Contributing

Contributions welcome! Submit a Pull Request.

## 📄 License

MIT License

---

**Built for the Railway community** 🚂