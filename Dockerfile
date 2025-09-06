# Start from official n8n image (Alpine-based)
FROM n8nio/n8n:latest

USER root

# Install Chromium + required dependencies on Alpine
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

# Install Playwright (Chromium only, no need for full bundle)
RUN npm install -g playwright && \
    npx playwright install chromium

# Environment variable so Playwright can find Chromium
ENV PLAYWRIGHT_BROWSERS_PATH=/root/.cache/ms-playwright
ENV CHROMIUM_PATH=/usr/bin/chromium-browser

USER node