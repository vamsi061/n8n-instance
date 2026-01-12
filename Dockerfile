# Always pull the latest n8n image
FROM n8nio/n8n:latest

# Cache-buster to force Render rebuilds
ARG BUILD_DATE
LABEL build_date=$BUILD_DATE
