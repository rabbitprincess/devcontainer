FROM debian AS builder

RUN apt update && apt install -y --no-install-recommends ca-certificates gnupg libatomic1 wget && \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV VERSION=27.1
ENV REPO=https://bitcoincore.org/bin/bitcoin-core-${VERSION}
ENV BITCOIN_CORE_SIGNATURE=71A3B16735405025D447E8F274810B012346C9A6

RUN cd /tmp && \
    gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys ${BITCOIN_CORE_SIGNATURE} && \
    wget ${REPO}/SHA256SUMS.asc ${REPO}/SHA256SUMS ${REPO}/bitcoin-${VERSION}-x86_64-linux-gnu.tar.gz && \
    gpg --verify --status-fd 1 --verify SHA256SUMS.asc SHA256SUMS 2>/dev/null | grep "^\[GNUPG:\] VALIDSIG.*${BITCOIN_CORE_SIGNATURE}\$" && \
    sha256sum --ignore-missing --check SHA256SUMS && \
    tar -xzvf bitcoin-${VERSION}-x86_64-linux-gnu.tar.gz -C /opt && \
    ln -sv bitcoin-${VERSION} /opt/bitcoin && \
    /opt/bitcoin/bin/test_bitcoin --show_progress && \
    rm -v /opt/bitcoin/bin/test_bitcoin /opt/bitcoin/bin/bitcoin-qt

FROM ubuntu:latest

WORKDIR /bitcoin

COPY --from=builder /opt/bitcoin/bin/* /usr/local/bin/

RUN apt update && apt install -y --no-install-recommends gosu libatomic1 && \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
