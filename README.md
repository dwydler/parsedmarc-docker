# EPK (Elastic, parsedmarc, Kibana)

## Overview
A Python package and CLI for parsing aggregate, forensic DMARC and TLS/MTA-STS reports,

This is a port of the native [parsedmarc application](https://github.com/domainaware/parsedmarc) into docker images.


## Requirements
* Docker & Docker Compose V2
* SSH/Terminal access (able to install commands/functions if non-existent)


## Install Docker, download containers und configure parsedmarc
1. This script will install docker and containerd:
  ```
  curl https://raw.githubusercontent.com/dwydler/parsedmarc-docker/master/misc/02-docker.io-installation.sh | bash
  ```
2. For IPv6 support, edit the Docker daemon configuration file, located at /etc/docker/daemon.json. Configure the following parameters and run `systemctl restart docker.service` to restart docker:
  ```
  {
    "experimental": true,
    "ip6tables": true
  }
  ```
3. Clone the repository to the correct folder for docker container:
  ```
  git clone https://github.com/dwydler/parsedmarc-docker.git /opt/containers/parsedmarc-docker
  git -C /opt/containers/parsedmarc-docker checkout $(git -C /opt/containers/parsedmarc-docker tag | tail -1)
  ```
4. Change the ownership for the elasticsearch data directory:
  ```
  sudo chown -R 1000:root /opt/containers/parsedmarc-docker/elasticsearch/data/
  ```
5. Create the .env file with random passwords:
  ```
  chmod 755 /opt/containers/parsedmarc-docker/setup-epk.sh
  /opt/containers/parsedmarc-docker/setup-epk.sh
  ```
6. Editing `/opt/containers/parsedmarc-docker/.env` and set your parameters and data. Any change requires an restart of the containers.
7. Editing `/opt/containers/parsedmarc-docker/parsedmarc/conf/parsedmarc.ini` and set your parameters for the application.
8. Starting application with `docker compose -f /opt/containers/parsedmarc-docker/docker-compose.yml up -d`.
9. Don't forget to test, that the application works successfully (e.g. http(s)://IP-Addresse or FQDN/).


## Update parsedmarc
1. When you're ready to update the code, you can checkout the latest tag:
  ```
   ( cd /opt/containers/parsedmarc-docker/ && git fetch && git checkout $(git tag | tail -1) )
  ```
2. No restart needed. The changes will take effect immediately.
