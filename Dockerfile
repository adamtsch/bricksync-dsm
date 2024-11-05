FROM ubuntu:22.04

LABEL name="BrickSyncDSM"
LABEL version=0.01


RUN apt-get update -q \
    && apt-get install -qy --no-install-recommends \
    wget \
    unzip \
    openssl \
    ca-certificates \
    && apt-get clean

WORKDIR /apps

ARG BRICKSYNC_VERSION=1.7.4-Feb2nd2024
RUN wget https://github.com/ZZJHONS/Bricksync/releases/download/v${BRICKSYNC_VERSION}/bricksync-linux64.zip -O 'bricksync.zip' \
    && mkdir bricksync \
    && unzip bricksync.zip -d temp_dir \
    && tar -xzf temp_dir/*.tar.gz -C . \
    && mv bricksync-linux64/bricksync bricksync \
    && rm -r temp_dir bricksync.zip bricksync-linux64

# TODO: is there a tool I can use to extract both archives with a clean interface?
WORKDIR /apps/bricksync
CMD ["./bricksync"]

