# Use an official Ubuntu 22.04 as a parent image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages and tools
RUN apt-get update && apt-get install -y \
    openjdk-8-jdk \
    wget \
    build-essential \
    python3 \
    python3-pip \
    verilator \
    libevent-dev \
    libjson-c-dev \
    device-tree-compiler \
    python3-setuptools \
    python3-requests \
    python3-pexpect \
    python3-colorama \
    python3-serial \
    python3-packaging \
    python3-yaml \
    ninja-build \
    curl \
    apt-transport-https \
    gnupg \
    cmake \
    git  # Install Git

# Install Meson
RUN pip3 install meson

# Install Git, (n)Migen / LiteX / Cores
WORKDIR /root
RUN wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py
RUN python3 litex_setup.py init install --user

# Install RISC-V GCC
WORKDIR /root
RUN wget https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz
RUN tar -xf riscv64-*.tar.gz
RUN mkdir /usr/local/riscv
RUN cp -r riscv64-*/* /usr/local/riscv

# Add Gowin Tools directory to PATH
ENV PATH="/IDE/bin:${PATH}"

# Set PATH for RISC-V GCC
ENV PATH="/usr/local/riscv/bin:${PATH}"

# Import the GPG key for Scala SBT repository
RUN apt-get update && apt-get install -y gnupg2
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv 99E82A75642AC823
RUN gpg --export --armor 99E82A75642AC823 | apt-key add -

# Install sbt
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list
RUN apt-get update && apt-get install -y sbt

# Copy the IDE folder into the Docker image
RUN mkdir /IDE
COPY ./IDE /IDE

# Build and install openFPGALoader

WORKDIR /root
# Add this line to install SWIG and other required dependencies
RUN apt-get update && apt-get install -y \
    git \
    gzip \
    libftdi1-2 \
    libftdi1-dev \
    libhidapi-hidraw0 \
    libhidapi-dev \
    libudev-dev \
    zlib1g-dev \
    cmake \
    pkg-config \
    make \
    g++ \
    swig \
    libreadline-dev

# Install the openFPGALoader form repository

RUN git clone https://github.com/trabucayre/openFPGALoader && \
    cd openFPGALoader && \
    mkdir build && cd build && cmake ..

WORKDIR /root/openFPGALoader/build
RUN make all
RUN cp openFPGALoader /usr/local/bin
WORKDIR /root

WORKDIR /home/
# Just clone the linux-on-litex repo on /home 
RUN git clone https://github.com/litex-hub/linux-on-litex-vexriscv.git
ENV JAVA_OPTS="-Xmx4g -Xms2g -XX:MaxMetaspaceSize=512m"
# Add the USB tools to the docker 
RUN apt-get update && apt-get install -y usbutils
# Fix the python link
RUN ln -s /usr/bin/python3 /usr/bin/python
# Let the /home/linux-on-litex-vexriscv be the default when login to the docker
WORKDIR /home/linux-on-litex-vexriscv

# Define the entry point or any other custom instructions
