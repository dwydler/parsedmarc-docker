# Reference image
FROM python:3.10.18-slim

# Metadata
LABEL org.opencontainers.image.authors="Daniel Wydler"

#
COPY /parsedmarc/docker/requirements.txt ./

#
RUN apt update \
    && apt install -y procps \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf /root/.cache/ \
    && rm -rf /var/lib/{apt,dpkg}/
