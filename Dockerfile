ARG CADDY_VERSION=2
ARG PLUGIN_VERSION

# Build Caddy with a pinned caddy-security using the official ALPINE builder image
FROM caddy:${CADDY_VERSION}-builder-alpine AS builder
ARG PLUGIN_VERSION
RUN xcaddy build \
    --with github.com/greenpau/caddy-security@v${PLUGIN_VERSION}

# Final runtime image (ALPINE)
FROM caddy:${CADDY_VERSION}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy