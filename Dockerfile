# Run custom Darknet weight training in Docker
# Linux X64
#  FROM ubuntu:18.04
FROM debian:stretch

LABEL maintainer="yuqianguk@gmail.com"

# Add General build requirements 
RUN \ 
    apt-get update  && apt-get install -y \
    autoconf \
    automake \
    libtool \
    build-essential \ 
    git \
    python-pip \
    python3-pip \
    wget 

# install addiatial dependencies
RUN pip3 install --upgrade pip

# working directory
WORKDIR /darknet

# build darknet
RUN \
    git clone https://github.com/AlexeyAB/darknet.git \
    &&  cd darknet \
    &&  make  

# Copy local file to docker image file 
COPY backup /darknet/darknet/backup/
COPY cfg /darknet/darknet/cfg/
COPY data /darknet/darknet/data

# working directory
WORKDIR /darknet/darknet

