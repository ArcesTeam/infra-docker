FROM ubuntu:22.04

LABEL org.opencontainers.image.source="https://github.com/ArcesTeam/infra-docker"
LABEL org.opencontainers.image.authors="ArcesTeam"
LABEL org.opencontainers.image.license="MIT"
LABEL arcesteam.role="base-image"

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash curl git ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && echo "ORG_BASE=1" >> /etc/profile.d/org.sh

CMD ["/bin/bash"]
