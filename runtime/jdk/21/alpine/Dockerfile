FROM ghcr.io/arcesteam/infra-docker/base/alpine:3.22

LABEL org.opencontainers.image.source="https://github.com/ArcesTeam/infra-docker"
LABEL org.opencontainers.image.authors="ArcesTeam"
LABEL org.opencontainers.image.license="MIT"
LABEL arcesteam.role="runtime-jdk-image"

ENV JDK_URL=https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.3+9/OpenJDK21U-jdk_x64_alpine-linux_hotspot_21.0.3_9.tar.gz

RUN curl -fsSL "${JDK_URL}" -o jdk.tar.gz \
    && mkdir -p /opt/jdk \
    && tar -xzf jdk.tar.gz -C /opt/jdk --strip-components=1 \
    && rm jdk.tar.gz \
    && ln -s /opt/jdk/bin/java /usr/bin/java \
    && ln -s /opt/jdk/bin/javac /usr/bin/javac

ENV JAVA_HOME=/opt/jdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"

CMD ["java", "-version"]
