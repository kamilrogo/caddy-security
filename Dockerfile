# Stage 1: Build Caddy with plugins using xcaddy
FROM caddy:builder-alpine AS builder

# Install build dependencies
RUN apk add --no-cache git bash

# Build custom Caddy with plugins
RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare

# Stage 2: Final image
FROM caddy:alpine

# Copy built Caddy binary
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
