ARG ALPINE_VERSION=3.12

FROM mirror.gcr.io/library/alpine:$ALPINE_VERSION

ARG S6_VERSION=v2.1.0.2
ARG S6_ARCH=amd64

ENV S6_OVERLAY_URL=https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-${S6_ARCH}.tar.gz

RUN set -xe && \
    wget -qO- $S6_OVERLAY_URL | tar xzC /

ARG UID=1000
ARG GID=1000

RUN addgroup -S -g ${GID} user && \
    adduser -S -u ${UID} -G user -s /bin/sh user

USER user

ENTRYPOINT ["/init"]
