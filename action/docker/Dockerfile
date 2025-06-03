FROM ghcr.io/arcesteam/infra-docker/base/alpine:3.22

LABEL org.opencontainers.image.source="https://github.com/ArcesTeam/infra-docker"
LABEL org.opencontainers.image.authors="ArcesTeam"
LABEL org.opencontainers.image.license="MIT"
LABEL arcesteam.role="action-docker-image"


RUN apk add --no-cache \
    docker-cli \
    docker-compose \
    jq \
    yq \
    just \
    coreutils \
    util-linux \
    && rm -rf /var/cache/apk/* \
    && echo "ORG_ACTION_DOCKER=1" >> /etc/profile.d/org.sh

ENTRYPOINT ["/bin/bash"]
