FROM ubuntu:20.04 AS builder

WORKDIR /tmp

RUN apt update && apt install tar wget -y

RUN wget https://github.com/develsoftware/GMinerRelease/releases/download/2.45/gminer_2_45_linux64.tar.xz && \
    tar xf gminer_2_45_linux64.tar.xz -C gminer


FROM nvidia/cuda:10.2-base

LABEL maintainer="Dockminer"

LABEL org.opencontainers.image.source https://github.com/dockminer/gminer

# Fix Driver bug
RUN ln -s /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1 /usr/lib/x86_64-linux-gnu/libnvidia-ml.so

COPY --from=builder /tmp/gminer/miner /usr/local/bin/miner

EXPOSE 8080

ENTRYPOINT [ "miner" ]