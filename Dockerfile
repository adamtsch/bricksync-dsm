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

RUN wget https://github.com/ZZJHONS/Bricksync/releases/download/v1.7.4-Feb2nd2024/bricksync-linux64.zip

RUN unzip bricksync-linux64.zip -d temp_dir && tar -xzf temp_dir/*.tar.gz -C . && rm -r temp_dir


ENTRYPOINT ["/bin/sleep", "infinity"]