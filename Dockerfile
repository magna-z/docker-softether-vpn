FROM alpine:3.7

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    SOFTETHER_VPN_VERSION=4.25 \
    SOFTETHER_VPN_BUILD=9656 \
    SOFTETHER_VPN_RELEASE_LABEL=rtm \
    SOFTETHER_VPN_RELEASE_DATE=2018.01.15

RUN set -ex && \
    apk add --no-cache \
        ca-certificates \
        libcrypto1.0 \
        libssl1.0 \
        readline && \
    apk add --no-cache --virtual build-deps \
        gcc \
        libc-dev \
        make \
        musl-dev \
        ncurses-dev \
        openssl-dev \
        readline-dev \
        wget && \
    wget -qO- http://www.softether-download.com/files/softether/v$SOFTETHER_VPN_VERSION-$SOFTETHER_VPN_BUILD-$SOFTETHER_VPN_RELEASE_LABEL-$SOFTETHER_VPN_RELEASE_DATE-tree/Source_Code/softether-src-v$SOFTETHER_VPN_VERSION-$SOFTETHER_VPN_BUILD-$SOFTETHER_VPN_RELEASE_LABEL.tar.gz | tar -xzf - -C /tmp && \
    cd /tmp/v$SOFTETHER_VPN_VERSION-$SOFTETHER_VPN_BUILD && \
    ./configure && make install && \
    cd /tmp \
    apk del --purge build-deps && \
    rm -rf /tmp/*

CMD ["vpnserver", "execsvc"]
