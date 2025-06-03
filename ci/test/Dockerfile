FROM ghcr.io/arcesteam/infra-docker/ci/core:1.0

LABEL org.opencontainers.image.source="https://github.com/ArcesTeam/infra-docker"
LABEL org.opencontainers.image.authors="ArcesTeam"
LABEL org.opencontainers.image.license="MIT"
LABEL arcesteam.role="ci-test-image"

RUN apk add --no-cache \
    docker-cli docker-compose py3-coverage \
    && rm -rf /var/cache/apk/*

ENV CI_TEST=true

ENTRYPOINT ["/bin/bash"]
