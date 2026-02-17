FROM node:20-alpine AS builder

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci --silent

# Copy sources and build
COPY . .
RUN npm run build -- --configuration=production

FROM nginx:1.25-alpine

# Replace main nginx config with provided one
# nginx config contains global directives so it must replace /etc/nginx/nginx.conf
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copy built angular app to /app (nginx config expects root /app)
COPY --from=builder /app/dist/olympic-games-starter/browser /app

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
