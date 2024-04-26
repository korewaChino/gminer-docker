FROM ubuntu:20.04 AS builder

WORKDIR /tmp
ARG GMINER_VERSION="3.44"
ARG GMINER_FILENAME="gminer_3_44_linux64.tar.xz"
ENV CUDA_DOCKER_ARCH=all

RUN mkdir gminer &&\
    apt update && apt install tar wget xz-utils -y

    RUN wget https://github.com/develsoftware/GMinerRelease/releases/download/${GMINER_VERSION}/${GMINER_FILENAME} && \
    tar xf ${GMINER_FILENAME} -C gminer


FROM nvidia/cuda:12.4.1-base-ubuntu22.04
LABEL org.opencontainers.image.source = "https://github.com/dockminer/gminer"

LABEL maintainer="cappy@cappuchino.xyz"

LABEL org.opencontainers.image.source https://github.com/dockminer/gminer
ENV CUDA_DOCKER_ARCH=all

# Fix Driver bug
RUN ln -s /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1 /usr/lib/x86_64-linux-gnu/libnvidia-ml.so

COPY --from=builder /tmp/gminer/miner /usr/local/bin/miner

EXPOSE 8080

ENTRYPOINT [ "miner" ]