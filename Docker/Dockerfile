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
	    bash-completion 
                        
WORKDIR /apps

# Raspberry Pi Pico SDK
ARG SDK_PATH=/apps/pico_sdk
RUN git clone --depth 1 https://github.com/raspberrypi/pico-sdk $SDK_PATH && \
    cd $SDK_PATH && \
    git submodule update --init

ENV PICO_SDK_PATH=$SDK_PATH


RUN cd /apps && git clone https://github.com/raspberrypi/openocd.git --depth=1 --recurse-submodules 
RUN cd openocd && ./bootstrap && ./configure --enable-ftdi --enable-sysfsgpio --enable-picoprobe --enable-cmsis-dap && make -j8 install

# Picotool installation
RUN cd /apps && git clone https://github.com/raspberrypi/picotool.git --depth=1
RUN cd picotool && mkdir build && cd build && cmake ../ && make -j8 && cp picotool /usr/local/bin

RUN cd /apps && git clone https://github.com/wtarreau/bootterm.git --depth=1 && \
    cd bootterm && make -j8 install 

RUN cd /usr/bin && ln -s /usr/bin/objdump objdump-multiarch && ln -s /usr/bin/nm nm-multiarch 
