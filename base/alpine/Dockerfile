FROM alpine:3.22

LABEL org.opencontainers.image.source="https://github.com/ArcesTeam/infra-docker"
LABEL org.opencontainers.image.authors="ArcesTeam"
LABEL org.opencontainers.image.license="MIT"
LABEL arcesteam.role="base-image"

RUN apk add --no-cache bash curl git ca-certificates \
    && echo "ORG_BASE=1" >> /etc/profile.d/org.sh

CMD ["/bin/bash"]
