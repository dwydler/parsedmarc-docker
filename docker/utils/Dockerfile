# Reference image
FROM alpine:3.23.3

# Metadata
LABEL maintainer="Daniel Wydler"
LABEL org.opencontainers.image.authors="Daniel Wydler"
LABEL org.opencontainers.image.description="A Python package and CLI for parsing aggregate and forensic DMARC reports."
LABEL org.opencontainers.image.documentation="https://github.com/dwydler/parsedmarc-docker/blob/master/README.md"
LABEL org.opencontainers.image.source="https://github.com/dwydler/parsedmarc-docker"
LABEL org.opencontainers.image.title="wydler/parsedmarc-utils"
LABEL org.opencontainers.image.url="https://github.com/dwydler/parsedmarc-docker"

# Install minimal runtime dependencies (bash, curl) without caching package index
RUN apk add --no-cache \
        bash \
        curl

#ENTRYPOINT [ "/bin/sh", "-c", "--" , "while true; do sleep 30; done;" ]
# Default command: start Bash shell
CMD ["/bin/bash"]
