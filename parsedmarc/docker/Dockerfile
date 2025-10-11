# Reference image
FROM python:3.12.12-slim

#
WORKDIR /

# Metadata
LABEL org.opencontainers.image.authors="Daniel Wydler"

#
COPY /parsedmarc/docker/requirements.txt ./

#
RUN apt-get update \
    && apt-get install -y \
    procps \
    && rm -r /var/lib/apt/lists/*
    
# Install python packages
RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf /root/.cache/
