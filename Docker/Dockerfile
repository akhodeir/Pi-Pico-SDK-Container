#Combination of multi repo
#https://github.com/lukstep/raspberry-pi-pico-docker-sdk/blob/main/Dockerfile
#https://github.com/shabaz123/rp2040tools/blob/main/pico-docker-steps.txt

#https://ceworkbench.wordpress.com/2022/08/24/pico/
#https://github.com/joesugar/vscode-devcontainer-raspberrypi-pico/blob/ubuntu-updates/.devcontainer/Dockerfile



FROM ubuntu:latest

# Set default shell during Docker image build to bash
SHELL ["/bin/bash", "-c"]

# Set non-interactive frontend for apt-get to skip any user confirmations
ENV DEBIAN_FRONTEND=noninteractive

# Install toolchain
RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install --no-install-recommends -y \
    git \
    python3 \
    python3-pip \
    python-is-python3 \
    cmake \
    build-essential \
    libusb-dev \
    wget \
    sudo \
    clang-format \
    automake \
    autoconf \
    ca-certificates \
    pkg-config \
    gdb-multiarch \
    binutils-multiarch \
    libtool \
    libftdi-dev \
    libusb-1.0-0-dev \
    libhidapi-dev \
    gcc-arm-none-eabi \
    libnewlib-arm-none-eabi \
    libstdc++-arm-none-eabi-newlib \
    bash-completion 
                        
WORKDIR /apps

# Raspberry Pi Pico SDK
ARG SDK_PATH=/apps/pico_sdk
RUN git clone --depth 1 https://github.com/raspberrypi/pico-sdk $SDK_PATH && \
    cd $SDK_PATH && \
    git submodule update --init

ENV PICO_SDK_PATH=$SDK_PATH

# Picotool installation
RUN cd /apps && \
    git clone --depth=1 https://github.com/raspberrypi/picotool.git && \
    cd picotool && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc) && \
    cmake --install . 
#   cp picotool /usr/local/bin

RUN cd /apps && \
    git clone --depth=1 https://github.com/wtarreau/bootterm.git  && \
    cd bootterm && \
    make -j$(nproc) install 

RUN cd /usr/bin && ln -s /usr/bin/objdump objdump-multiarch && ln -s /usr/bin/nm nm-multiarch 
