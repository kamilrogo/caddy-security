FROM caddy:builder-alpine AS builder

RUN xcaddy build \
        --with github.com/greenpau/caddy-security \
        --with github.com/caddy-dns/cloudflare \
	--with github.com/caddyserver/caddy/v2=github.com/caddyserver/caddy/v2@v2.6.4

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
