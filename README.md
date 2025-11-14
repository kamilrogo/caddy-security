
# Caddy + Caddy-Security (Alpine Auto-Build)

This repo automatically builds a **Caddy (Alpine)** image with the **caddy-security** plugin included.
All builds run on **GitHub Actions** — no local compiling needed.

### Features

* Lightweight **Alpine** base
* Includes **caddy-security** plugin
* Auto-builds **only when Caddy releases a new version**
* Tags:

  * `latest` — newest build
  * `<caddy-version>-alpine` — pinned version for rollback

---

## Pull the image

```
ghcr.io/kamilrogo/caddy-security:latest
```

or a versioned tag:

```
ghcr.io/kamilrogo/caddy-security:2.10.2-alpine
```

---

## Run it

```bash
docker run --rm \
  -p 80:80 -p 443:443 \
  -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
  ghcr.io/kamilrogo/caddy-security:latest
```

---

## How it works

* GitHub Actions checks `caddy:alpine` daily
* If Caddy has a new version → a new image is built and pushed
* If not → the workflow exits instantly
* Your server only needs to **pull** the image

---

## Files

```
Dockerfile
.github/workflows/build.yml
```
