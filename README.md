# Caddy + caddy-security (Alpine Auto-Build)

![Build Status](https://github.com/kamilrogo/caddy-security/actions/workflows/docker-ghcr.yml/badge.svg)

This project provides automated, up-to-date Docker images of [Caddy](https://caddyserver.com/) enhanced with the [caddy-security](https://github.com/greenpau/caddy-security) plugin. Images are based on Alpine Linux and are rebuilt daily using GitHub Actions to track the latest upstream releases.

---

## 📦 Image Tags

Images are available via GitHub Container Registry:

```
ghcr.io/kamilrogo/caddy-security:latest
ghcr.io/kamilrogo/caddy-security:<caddy>-alpine-sec-<plugin>
```

Example:
```
ghcr.io/kamilrogo/caddy-security:2.10.3-alpine-sec-1.1.22
```

---

## 🚀 Quick Start

```bash
docker run --rm \
  -p 80:80 -p 443:443 \
  -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
  ghcr.io/kamilrogo/caddy-security:latest
```

- Make sure to provide your Caddyfile.
- For persistence (e.g. certificates), mount `/data` and `/config` as volumes.

---

## ⚙️ How It Works

- Detects latest Caddy and caddy-security plugin versions
- Automatically rebuilds and pushes images if updates are detected
- Publishes both `latest` and versioned tags

CI is powered by [GitHub Actions](.github/workflows/docker-ghcr.yml), running daily.

---

## 🛠 Technologies

- Docker (Alpine base)
- Caddy web server
- caddy-security plugin
- GitHub Actions (CI/CD)

---

## 📚 References

- [Caddy web server](https://caddyserver.com/)
- [caddy-security plugin](https://github.com/greenpau/caddy-security)
- [Container on GHCR](https://github.com/users/kamilrogo/packages/container/package/caddy-security)

---

## 🤝 Contribution

Currently, issues are disabled. For suggestions, contact [@kamilrogo](https://github.com/kamilrogo).
