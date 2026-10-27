FROM ubuntu:22.04

LABEL name="BrickSyncDSM"
LABEL version=0.01

RUN apt-get update -q \
    && apt-get install -qy --no-install-recommends \
    wget \
    openssl \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /apps

ARG BRICKSYNC_VERSION=1.7.4-271026c
RUN wget -q "https://github.com/ZZJHONS/Bricksync/releases/download/v${BRICKSYNC_VERSION}/bricksync-linux64.tar.gz" -O bricksync.tar.gz \
    && tar -xzf bricksync.tar.gz \
    && rm bricksync.tar.gz

WORKDIR /apps/bricksync-linux64
CMD ["./bricksync"]