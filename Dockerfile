# Pin version — DO NOT use :latest
FROM n8nio/n8n:2.2.6

USER root

# Install Chromium and dependencies
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    wget \
    bash \
    udev \
    xvfb \
    nodejs \
    npm

# Install Playwright (Chromium only)
RUN npm install -g playwright@latest && \
    npx playwright install chromium --with-deps

# Environment variables
ENV PLAYWRIGHT_BROWSERS_PATH=/root/.cache/ms-playwright
ENV CHROMIUM_PATH=/usr/bin/chromium

USER node
