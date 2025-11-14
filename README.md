# Caddy + Caddy-Security (Alpine Auto-Build)

![Build Status](https://github.com/kamilrogo/caddy-security/actions/workflows/docker-ghcr.yml/badge.svg)

This repository automatically builds a **Caddy (Alpine)** Docker image with the **caddy-security** plugin.
GitHub Actions checks daily for new versions of **Caddy** or **caddy-security** and rebuilds the image when needed.

---

## 📦 Image

```
ghcr.io/kamilrogo/caddy-security:latest
ghcr.io/kamilrogo/caddy-security:<caddy>-alpine-sec-<plugin>
```

Example:

```
ghcr.io/kamilrogo/caddy-security:2.10.3-alpine-sec-1.1.22
```

---

## 🚀 Run

```bash
docker run --rm \
  -p 80:80 -p 443:443 \
  -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
  ghcr.io/kamilrogo/caddy-security:latest
```

---

## ⚙️ How It Works

* Fetches current **Caddy version** from `caddy:alpine`
* Fetches latest **caddy-security version** using Go module metadata
* Compares against existing GHCR tags
* Builds only when a new version is found
* Publishes:

  * `latest`
  * `<caddy>-alpine-sec-<plugin>`

---

