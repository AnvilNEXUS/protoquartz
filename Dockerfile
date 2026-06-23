# --- Build Stage ---
FROM node:24-slim AS builder

# Install git (required for npm to fetch Quartz plugins)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy dependency and lockfiles
COPY package.json package-lock.json* quartz.lock.json* ./

# Install npm dependencies
RUN npm ci

# Copy everything else
COPY . .

# Install Quartz community plugins, then build
RUN npx quartz plugin install && npx quartz build

# --- Production Stage ---
FROM nginx:alpine
COPY --from=builder /app/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]