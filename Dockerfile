FROM  alpine:latest
RUN   adduser -S -D -H -h /ole miner
RUN   wget https://github.com/turtlecoin/violetminer/releases/download/v0.2.2/violetminer-linux-v0.2.2.tar.gz && \
      tar -xvf violetminer-linux-v0.2.2.tar.gz &&\
      cd violetminer-linux-v0.2.2 &&\
      mv violetminer ole \
USER miner
WORKDIR    /violetminer-linux-v0.2.2
ENTRYPOINT  ["./ole"]
