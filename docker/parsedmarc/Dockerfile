# Reference image
FROM python:3.12.12-slim

# Metadata
LABEL maintainer="Daniel Wydler"
LABEL org.opencontainers.image.authors="Daniel Wydler"
LABEL org.opencontainers.image.description="A Python package and CLI for parsing aggregate and forensic DMARC reports."
LABEL org.opencontainers.image.documentation="https://github.com/dwydler/parsedmarc-docker/blob/master/README.md"
LABEL org.opencontainers.image.source="https://github.com/dwydler/parsedmarc-docker"
LABEL org.opencontainers.image.title="wydler/parsedmarc-app"
LABEL org.opencontainers.image.url="https://github.com/dwydler/parsedmarc-docker"

# Defines the folder where all subsequent commands in the Dockerfile are executed
WORKDIR /

# Copies files from the build context to the image
COPY ./docker/parsedmarc/requirements.txt ./

# -------------------------------------------------------------------
# Install system utilities
# - set -eux :                                          Stops on errors, displays all commands, warns about unset variables
# - apt-get update :                                    Updates the package lists
# - apt-get install -y --no-install-recommends procps : Installs only the required procps package (ps, top, etc.) without unnecessary additional packages
# - rm -rf /var/lib/apt/lists/* :                       Deletes temporary package lists, saves space in the image
# -------------------------------------------------------------------
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends procps; \
    rm -rf /var/lib/apt/lists/*
    
# Install python packages
RUN pip install --no-cache-dir -r requirements.txt

# Creates a new user in the container named parsedmarc
RUN useradd -ms /bin/bash parsedmarc

# Switches the user under which all subsequent commands in the container run
USER parsedmarc

# Standard ENTRYPOINT
ENTRYPOINT ["parsedmarc"]

# Prevents the container from simply crashing if you forgot to pass arguments
CMD ["--help"]
