# --- Build Stage ---
FROM node:24-alpine AS builder

WORKDIR /app

# Copy dependency and lockfiles
COPY package.json package-lock.json* quartz.lock.json* ./

# Install npm dependencies
RUN npm ci

# Copy everything else (including .quartz/plugins if pre-built, and content)
COPY . .

# Install Quartz community plugins, then build
RUN npx quartz plugin install && npx quartz build

# --- Production Stage ---
FROM nginx:alpine
COPY --from=builder /app/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]