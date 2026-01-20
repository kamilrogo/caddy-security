ARG CADDY_VERSION

# Build Caddy with caddy-security using the official ALPINE builder image
FROM caddy:${CADDY_VERSION}-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security@latest

# Final runtime image (ALPINE)
FROM caddy:${CADDY_VERSION}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
