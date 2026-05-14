# Reference image
FROM python:3.14.5-slim@sha256:7a500125bc50693f2214e842a621440a1b1b9cbb2188f74ab045d29ed2ea5856

# Metadata
LABEL maintainer="Daniel Wydler"
LABEL org.opencontainers.image.authors="Daniel Wydler"
LABEL org.opencontainers.image.description="A Python package and CLI for parsing aggregate and forensic DMARC reports."
LABEL org.opencontainers.image.documentation="https://github.com/wydler/parsedmarc-docker/blob/master/README.md"
LABEL org.opencontainers.image.source="https://github.com/wydler/parsedmarc-docker"
LABEL org.opencontainers.image.title="wydler/parsedmarc-app"
LABEL org.opencontainers.image.url="https://github.com/wydler/parsedmarc-docker"

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
# USER parsedmarc

# Standard ENTRYPOINT
ENTRYPOINT ["parsedmarc"]

# Prevents the container from simply crashing if you forgot to pass arguments
CMD ["--help"]
