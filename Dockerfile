FROM  alpine:latest
RUN   adduser -S -D -H -h /xmrig miner
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        git \
        cmake \
        libuv-dev \
        build-base && \
      wget https://github.com/uPlexa/xmrig-upx/archive/v0.2.0.tar.gz && \
      tar -xvf v0.2.0.tar.gz &&\
      cd xmrig-upx-0.2.0 && \
      cmake -DWITH_HTTPD=OFF . && \
      make -j$(nproc) && \
      apk del \
        build-base \
        cmake \
        git
USER miner
WORKDIR    /xmrig-upx-0.2.0
ENTRYPOINT  ["./xmrig"]
