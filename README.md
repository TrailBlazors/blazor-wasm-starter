# Blazor WebAssembly Starter

**A production-ready Blazor WebAssembly (WASM) template for Railway deployment.**

Build client-side web applications that run entirely in the browser with C# and .NET 9. No server required after initial download — perfect for PWAs, offline-capable apps, and static hosting.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/LMob5c?referralCode=Ce0gB7)

## ✨ Features

- 🌐 **Client-Side Execution** - Runs entirely in the browser via WebAssembly
- ⚡ **Zero JavaScript** - Write your entire app in C# 
- 📱 **PWA Ready** - Offline support and installable apps
- 🚀 **Fast Loading** - Optimized with gzip compression and nginx
- 🐳 **Docker Optimized** - Multi-stage builds for minimal image size
- 🎯 **.NET 9** - Latest WebAssembly runtime and features
- 💰 **Cost-Efficient** - Static hosting is cheaper than server apps
- 🔒 **Secure** - No server-side code execution, reduced attack surface

## 🚀 Quick Start

### Deploy to Railway

Click the "Deploy on Railway" button above. Railway will:
- Build your WASM app using Docker
- Compile C# to WebAssembly
- Serve static files via nginx
- Generate a public URL with SSL

**Total deployment time: ~90 seconds** ⏱️

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

### Build for Production Locally
```bash
# Build the WASM app
dotnet publish -c Release

# Output is in bin/Release/net9.0/publish/wwwroot/
```

## 📁 Project Structure
```
blazor-wasm-starter/
├── BlazorWasmStarter/          # WASM application
│   ├── Pages/                  # Page components
│   │   ├── Home.razor         # Home page
│   │   ├── Counter.razor      # Interactive counter demo
│   │   └── Weather.razor      # Sample data page
│   ├── Layout/                 # Layout components
│   │   ├── MainLayout.razor   # Main layout
│   │   └── NavMenu.razor      # Navigation menu
│   ├── wwwroot/                # Static assets
│   │   ├── index.html         # Entry point
│   │   ├── css/               # Stylesheets
│   │   └── favicon.png        # Icon
│   ├── _Imports.razor         # Global using statements
│   ├── App.razor              # Root component
│   └── Program.cs             # App configuration
├── Dockerfile                  # Multi-stage Docker build
├── nginx.conf                  # nginx web server config
├── railway.toml                # Railway configuration
├── .dockerignore              # Docker ignore rules
└── README.md                   # Documentation
```

## 🌐 Blazor WASM vs Server

### WebAssembly (This Template)
✅ Runs in browser (client-side)  
✅ Works offline after first load  
✅ Lower server costs (static hosting)  
✅ Better for public-facing apps  
✅ No server connection required  
❌ Larger initial download (~2-5 MB)  
❌ Requires WebAssembly support  
❌ Limited to browser APIs  

### Blazor Server
✅ Smaller initial download  
✅ Better SEO (server-rendered)  
✅ Full .NET API access  
❌ Requires constant server connection  
❌ Higher hosting costs  
❌ Latency on every interaction  

**Use WASM for:**
- Public websites and marketing pages
- Offline-capable applications
- Client-side tools and calculators
- Mobile apps (via PWA)
- Low-latency interactive UIs

**Use Server for:**
- Internal dashboards
- Real-time collaborative apps
- Database-heavy applications
- SEO-critical content

## 🛠️ Customization & Extension

### Add API Backend

WASM apps typically need an API for data. Deploy a separate API service on Railway:

**Option 1: ASP.NET Core Web API**
```bash
# Create API project
dotnet new webapi -n BlazorWasmApi

# Configure CORS to allow your WASM app
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowBlazor",
        policy => policy.WithOrigins("https://your-wasm-app.railway.app")
                        .AllowAnyMethod()
                        .AllowAnyHeader());
});

# Add to Railway as separate service
```

**Option 2: Use our Blazor + PostgreSQL Template**
Deploy our full-stack template for the API, then call it from WASM.

### Enable PWA Features

Make your app installable and work offline:
```bash
# Create with PWA template
dotnet new blazorwasm --pwa -n BlazorWasmStarter

# This adds:
# - Service worker for offline support
# - manifest.json for installation
# - Icon assets
```

### Call External APIs
```csharp
@inject HttpClient Http

@code {
    private WeatherForecast[]? forecasts;

    protected override async Task OnInitializedAsync()
    {
        forecasts = await Http.GetFromJsonAsync<WeatherForecast[]>(
            "https://api.example.com/WeatherForecast");
    }
}
```

### Add Authentication

**Option 1: Azure AD B2C**
```bash
dotnet add package Microsoft.AspNetCore.Components.WebAssembly.Authentication
```

**Option 2: Auth0**
```bash
dotnet add package Auth0.AuthenticationApi
```

**Option 3: Custom JWT Authentication**
Authenticate with your API and store tokens in browser storage.

### Add State Management
```bash
# Fluxor - Redux pattern for Blazor
dotnet add package Fluxor.Blazor.Web

# Or use built-in cascading parameters
```

### Add Component Libraries
```bash
# MudBlazor - Material Design components
dotnet add package MudBlazor

# Radzen - Rich component library
dotnet add package Radzen.Blazor

# Microsoft Fluent UI
dotnet add package Microsoft.Fast.Components.FluentUI
```

## 🎯 Real-World Use Cases

### 📊 Data Visualization Dashboards
Build interactive charts and graphs that run entirely client-side. Perfect for business intelligence tools without server costs.

### 🧮 Calculators & Tools
Mortgage calculators, unit converters, financial planners — all running in the browser with C# logic.

### 📱 Progressive Web Apps (PWA)
Create installable apps that work offline. Users can add to home screen on mobile and desktop.

### 🎮 Browser Games
Build games with C# that run in the browser. Use WebAssembly for near-native performance.

### 📝 Content-Rich Websites
Marketing sites, portfolios, documentation — enhanced with interactive C# components.

### 🛠️ Developer Tools
Code formatters, regex testers, JSON validators — all client-side with zero server costs.

### 📖 Documentation Sites
Interactive documentation with live code samples and component demos.

### 🎨 Design Systems
Component showcases and pattern libraries for your design team.

## 🐳 Docker & nginx Configuration

### Multi-Stage Build Process

**Stage 1: Build** (SDK image)
- Restore NuGet packages
- Compile C# to .NET assemblies
- Compile .NET to WebAssembly
- Optimize and bundle assets

**Stage 2: Serve** (nginx image)
- Copy static files from build stage
- Configure nginx for SPA routing
- Enable gzip compression
- Set up MIME types for WASM

### nginx Optimization

The included `nginx.conf` provides:
- ✅ Proper MIME type for `.wasm` files
- ✅ SPA routing (all routes → index.html)
- ✅ Gzip compression for faster loading
- ✅ Efficient serving on port 8080

### Custom nginx Configuration

Edit `nginx.conf` to add:
- Cache headers for static assets
- Security headers
- Custom redirects
- Additional compression types

## ⚡ Performance Optimization

### Reduce Download Size

**Use AOT Compilation:**
```xml
<PropertyGroup>
  <RunAOTCompilation>true</RunAOTCompilation>
</PropertyGroup>
```

**Enable Trimming:**
```xml
<PropertyGroup>
  <PublishTrimmed>true</PublishTrimmed>
</PropertyGroup>
```

**Use Brotli Compression:**
Update `nginx.conf` to enable Brotli for even better compression.

### Lazy Loading

Load assemblies on-demand:
```csharp
@using Microsoft.AspNetCore.Components.WebAssembly.Services

@inject LazyAssemblyLoader AssemblyLoader

// Load assembly only when needed
await AssemblyLoader.LoadAssembliesAsync(
    new[] { "MyFeature.dll" });
```

### Prerendering

Pre-render pages at build time for faster initial load:
```xml
<PropertyGroup>
  <BlazorWebAssemblyPrerender>true</BlazorWebAssemblyPrerender>
</PropertyGroup>
```

## 🔐 Security Best Practices

### Never Store Secrets Client-Side
WASM code runs in the browser — anyone can read it. Never include:
- ❌ API keys
- ❌ Database credentials
- ❌ Sensitive business logic

### Use Environment-Based Configuration
```csharp
builder.Configuration.AddJsonFile(
    $"appsettings.{builder.HostEnvironment.Environment}.json");
```

### Implement Authentication Properly
- Use secure token storage
- Implement token refresh
- Validate on the server
- Use HTTPS only

## 📚 Learn More

### Official Resources
- [Blazor WASM Docs](https://learn.microsoft.com/en-us/aspnet/core/blazor/hosting-models#blazor-webassembly) - Official Microsoft documentation
- [.NET 9 WASM Features](https://learn.microsoft.com/en-us/dotnet/core/whats-new/dotnet-9) - Latest .NET improvements
- [WebAssembly Specification](https://webassembly.org/) - Understanding WASM technology

### Community & Examples
- [Awesome Blazor](https://github.com/AdrienTorris/awesome-blazor) - Curated list of resources
- [Blazor University](https://blazor-university.com/) - Comprehensive tutorials
- [Blazor School](https://blazor-school.com/) - Learning platform

### Deployment & Hosting
- [Railway Docs](https://docs.railway.app/) - Platform documentation
- [nginx Documentation](https://nginx.org/en/docs/) - Web server configuration
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/) - Container optimization

## 🎓 Example Projects

**Portfolio Website**
```bash
# Single-page portfolio with projects, blog, contact
# 100% client-side, zero server costs
```

**PWA Task Manager**
```bash
# Offline-first todo app
# Works without internet after first load
# Syncs when online
```

**API Documentation**
```bash
# Interactive API explorer
# Test endpoints directly in browser
# No backend required
```

## 🤝 Contributing

Contributions welcome! Here's how:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

MIT License - see LICENSE file for details

---

## 🚀 Ready to Deploy?

**Three ways to get started:**

1. **One-Click Railway Deploy** - Click the button at the top
2. **Clone and Customize** - Fork this repo and make it yours
3. **Learn by Exploring** - Check out the code and documentation

---

**Built with ❤️ for the Railway community** 🚂

**Need a database?** Check out our [Blazor + PostgreSQL Starter](https://railway.app/template/YOUR_POSTGRES_TEMPLATE_ID) for full-stack apps!

**Questions?** Open an issue on GitHub or reach out on the Railway Discord.