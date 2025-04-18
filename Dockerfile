FROM caddy:builder-alpine AS builder

RUN apk add --no-cache git bash

RUN xcaddy build \
        --with github.com/greenpau/caddy-security \
        --with github.com/caddy-dns/cloudflare

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
