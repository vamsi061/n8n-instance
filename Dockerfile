FROM n8nio/n8n:2.2.6

USER root

# Install Chromium and dependencies (Debian)
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    fonts-liberation \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libasound2 \
    libgbm1 \
    libpangocairo-1.0-0 \
    libxshmfence1 \
    ca-certificates \
    wget \
    bash \
    xvfb \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install Playwright (Chromium only)
RUN npm install -g playwright@latest && \
    npx playwright install chromium

# Environment variables
ENV PLAYWRIGHT_BROWSERS_PATH=/root/.cache/ms-playwright
ENV CHROMIUM_PATH=/usr/bin/chromium

USER node
