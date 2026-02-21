# Reference image
FROM nginx:1.29.5

# Metadata
LABEL maintainer="Daniel Wydler"
LABEL org.opencontainers.image.authors="Daniel Wydler"
LABEL org.opencontainers.image.description="A Python package and CLI for parsing aggregate and forensic DMARC reports."
LABEL org.opencontainers.image.documentation="https://github.com/dwydler/parsedmarc-docker/blob/master/README.md"
LABEL org.opencontainers.image.source="https://github.com/dwydler/parsedmarc-docker"
LABEL org.opencontainers.image.title="wydler/parsedmarc-nginx"
LABEL org.opencontainers.image.url="https://github.com/dwydler/parsedmarc-docker"

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
