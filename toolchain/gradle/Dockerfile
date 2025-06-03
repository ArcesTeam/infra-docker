FROM ghcr.io/arcesteam/infra-docker/runtime/jdk:21-alpine

LABEL org.opencontainers.image.source="https://github.com/ArcesTeam/infra-docker"
LABEL org.opencontainers.image.authors="ArcesTeam"
LABEL org.opencontainers.image.license="MIT"
LABEL arcesteam.role="toolchain-gradle-image"

ENV GRADLE_URL=https://services.gradle.org/distributions/gradle-8.13-bin.zip
ENV GRADLE_HOME=/opt/gradle

RUN apk add --no-cache unzip \
    && curl -fsSL "${GRADLE_URL}" -o gradle.zip \
    && mkdir -p "${GRADLE_HOME}" \
    && unzip -q gradle.zip -d "${GRADLE_HOME}" \
    && rm gradle.zip \
    && ln -s "${GRADLE_HOME}/gradle-8.13/bin/gradle" /usr/bin/gradle \

ENV PATH="${GRADLE_HOME}/gradle-8.13/bin:${PATH}"

CMD ["gradle", "--version"]
