# syntax=docker/dockerfile:1

# Build stage: nothing to compile (static site)
# Runtime stage: serve static files with nginx Alpine

FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy project files into the nginx document root
COPY . /usr/share/nginx/html/

# Prevent nginx from running as root inside the container (nginx Alpine image
# already drops privileges to the "nginx" user by default). Keep the
# configuration minimal and secure.

# Expose HTTP port 80 to the host (mapped to 8080 in docker-compose.yml)
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
