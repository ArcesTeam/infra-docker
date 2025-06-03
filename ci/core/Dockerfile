FROM ghcr.io/arcesteam/infra-docker/toolchain/gradle:8.13

LABEL org.opencontainers.image.source="https://github.com/ArcesTeam/infra-docker"
LABEL org.opencontainers.image.authors="ArcesTeam"
LABEL org.opencontainers.image.license="MIT"
LABEL arcesteam.role="ci-core-image"

ENV CACHE_HOME=/cache
ENV GRADLE_USER_HOME=$CACHE_HOME/.gradle
ENV CI=true \
    CI_PROJECT_DIR=/workspace \
    CI_PROJECT_NAME=ci-core \
    CI_PROJECT_NAMESPACE=arcesteam \
    ORG_CI=true \
    ORG_WORKSPACE=/workspace \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apk add --no-cache \
    just tree coreutils openssh-client jq \
    && mkdir -p "${GRADLE_USER_HOME}" /workspace \
    && ln -s "${GRADLE_USER_HOME}" "${HOME}/.gradle" \
    && rm -rf /var/cache/apk/* \
    && echo "ORG_CI=1" >> /etc/profile.d/org.sh

WORKDIR /workspace
