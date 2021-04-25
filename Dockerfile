FROM ubuntu:20.10

LABEL maintainer="rafael.hrovat@icloud.com"
LABEL version="0.1.0"
LABEL description="CPU nheqminer ubuntu docker image"

# This variable will be used to pass options to ccminer when the container is started
ENV MINER_OPTIONS=""

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt update

# Install dependencies
RUN apt install -y git cmake build-essential libboost-all-dev

# Clone the nheqminer repo
RUN mkdir /home/crypto
WORKDIR /home/crypto
RUN git clone --single-branch -b Linux https://github.com/nicehash/nheqminer.git
WORKDIR /home/crypto/nheqminer/cpu_xenoncat/Linux/asm

RUN sh assemble.sh

WORKDIR /home/crypto/nheqminer/Linux_cmake/nheqminer_cpu

RUN cmake . && make
RUN ln -s /home/crypto/nheqminer/Linux_cmake/nheqminer_cpu/nheqminer_cpu /usr/local/bin/nheqminer_cpu

# Add the command that will be executed when the cointainer is started
CMD nheqminer_cpu ${MINER_OPTIONS}