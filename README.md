
# GMiner

[![Docker Image CD](https://github.com/dockminer/gminer/actions/workflows/dockerimage-cd.yaml/badge.svg)](https://github.com/dockminer/gminer/actions/workflows/dockerimage-cd.yaml)
[![Docker Pulls](https://img.shields.io/docker/pulls/dockminer/gminer?color=orange)](https://hub.docker.com/r/dockminer/gminer)
[![GitHub](https://img.shields.io/github/license/dockminer/gminer?color=blue)](LICENSE.md)

GMiner was created by a Russian group of specialists in the field of high performance computing and cryptography.

The first version of GMiner was released on September 21, 2018 and was received quite warmly among users.<br/>
Thanks to its unique developments and stability, in just six months, the miner became a favorite on the Equihash algorithms.

The miner is focused on NVIDIA and AMD platforms and supports most popular algorithms such as: Ethash, ProgPoW, KAWPOW, Equihash, CuckooCycle.

GMiner maintains a leading position in the mining of such coins as Beam, Grin, Cortex, Bitcoin Gold.<br/>
In 2020, the miner added support for Ethash, ProgPoW and KAWPOW algorithms with high performance relative to competitors.

The development team never stops at what has been achieved and achieves the maximum performance of the algorithms with the minimum power consumption, it is these qualities that distinguish GMiner from the competitors and win the hearts of users.

For a detailed description of features read [here](https://github.com/develsoftware/GMinerRelease).

## How to use this image

Run the following commands in your terminal:

`docker run --gpus all -d dockminer/gminer:latest [miner arguments]`

The container should up and start mining.

In default, the docker expose the 8080 port for GMiner monitoring page, you can connect http://localhost:8080 to see the web page.

## Image Information

This image is built on top of the following softwares:

- [Nvidia CUDA Container](https://gitlab.com/nvidia/container-images/cuda) v11.3.1
- [GMiner](https://github.com/develsoftware/GMinerRelease) v2.75