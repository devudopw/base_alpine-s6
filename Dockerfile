ARG ALPINE_VERSION=3.12

FROM mirror.gcr.io/library/alpine:$ALPINE_VERSION

ARG S6_VERSION=v2.1.0.2
ARG S6_ARCH=amd64

ARG S6_OVERLAY_URL=https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-${S6_ARCH}.tar.gz

RUN set -xe && \
    wget -qO- $S6_OVERLAY_URL | tar xzC /

ENTRYPOINT ["/init"]
