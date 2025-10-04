# Reference image
FROM nginx:1.29.1

# Metadata
LABEL org.opencontainers.image.authors="Daniel Wydler"

# Package lists reread and updated
# Install package(s)
# Remove the package lists
RUN apt-get update \
    && apt-get install -y \
    certbot \
    python3-certbot-nginx \
    && rm -r /var/lib/apt/lists/*

#
COPY --chmod=755 /nginx/docker/99-certbot.sh /docker-entrypoint.d/

#
CMD ["nginx", "-g", "daemon off;"]
