FROM  alpine:latest
RUN   adduser -S -D -H -h /xmrig miner
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        git \
        cmake \
        libuv-dev \
        build-base && \
      wget https://github.com/VerusCoin/nheqminer/releases/download/v0.8.2/nheqminer-Linux-v0.8.2.tgz && \
      tar -xvf nheqminer-Linux-v0.8.2.tgz &&\
      tar -xvf nheqminer-Linux-v0.8.2.tar.gz &&\
      cd nheqminer && \
      apk del \
        build-base \
        cmake \
        git
USER miner
WORKDIR    /nheqminer
ENTRYPOINT  ["./nheqminer"]
