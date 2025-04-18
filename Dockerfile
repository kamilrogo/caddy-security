# Stage 1: Build Caddy with plugins using xcaddy
FROM caddy:builder-alpine AS builder

# Install build dependencies and xcaddy
RUN apk add --no-cache git curl bash && \
    curl -fsSL https://github.com/caddyserver/xcaddy/releases/latest/download/xcaddy_linux_amd64 -o /usr/bin/xcaddy && \
    chmod +x /usr/bin/xcaddy

# Build custom Caddy with plugins
RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare

# Stage 2: Final image
FROM caddy:alpine

# Copy built Caddy binary
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

