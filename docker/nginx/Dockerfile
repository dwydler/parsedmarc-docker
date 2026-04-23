# Reference image
FROM nginx:1.29.8@sha256:6e23479198b998e5e25921dff8455837c7636a67111a04a635cf1bb363d199dc

# Metadata
LABEL maintainer="Daniel Wydler"
LABEL org.opencontainers.image.authors="Daniel Wydler"
LABEL org.opencontainers.image.description="A Python package and CLI for parsing aggregate and forensic DMARC reports."
LABEL org.opencontainers.image.documentation="https://github.com/wydler/parsedmarc-docker/blob/master/README.md"
LABEL org.opencontainers.image.source="https://github.com/wydler/parsedmarc-docker"
LABEL org.opencontainers.image.title="wydler/parsedmarc-nginx"
LABEL org.opencontainers.image.url="https://github.com/wydler/parsedmarc-docker"

# Defines the folder where all subsequent commands in the Dockerfile are executed
WORKDIR /

# -------------------------------------------------------------------
# Install Certbot and the Nginx plugin
# - --no-install-recommends: avoids unnecessary packages
# - apt-get clean + rm -rf /var/lib/apt/lists/*: reduces the image size by removing the cache and package lists
# -------------------------------------------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        certbot \
        python3-certbot-nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copies files from the build context to the image
COPY --chmod=755 ./docker/nginx/99-certbot.sh /docker-entrypoint.d/

#
CMD ["nginx", "-g", "daemon off;"]
