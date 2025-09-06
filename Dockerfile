# Start from official n8n image
FROM n8nio/n8n:latest

# Switch to root to install system dependencies
USER root

# Install all required dependencies for Chromium (Playwright)
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libxshmfence1 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Install Playwright globally + Chromium browser
RUN npm install -g playwright && \
    npx playwright install chromium

# Tell Playwright where browsers are
ENV PLAYWRIGHT_BROWSERS_PATH=/root/.cache/ms-playwright

# Back to n8n user
USER node
