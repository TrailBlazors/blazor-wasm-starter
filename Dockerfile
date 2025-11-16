# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy and restore
COPY BlazorWasmStarter/BlazorWasmStarter.csproj BlazorWasmStarter/
RUN dotnet restore "BlazorWasmStarter/BlazorWasmStarter.csproj"

# Build
COPY BlazorWasmStarter/ BlazorWasmStarter/
WORKDIR /src/BlazorWasmStarter
RUN dotnet publish "BlazorWasmStarter.csproj" -c Release -o /app/publish

# Stage 2: Serve with nginx
FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# Copy published files
COPY --from=build /app/publish/wwwroot .

# Copy nginx config
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8080