#!/usr/bin/bash
set -x

# get all variables
source env.sh

# prepare the OS
sudo apt-get -y install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev libglib2.0-dev sshfs device-tree-compiler libboost-regex-dev libboost-system-dev libboost-program-options-dev python3-dev unzip libpixman-1-dev rsync wget cpio python3-numpy python3-matplotlib

# artifact
git clone --recurse-submodules --branch sp2026-seqass https://github.com/comparch-security/spike-flexicas.git $SPIKE
git clone https://github.com/comparch-security/sp2026-seqass-ball-test.git $BALL_TEST

# infrastructure
git clone --branch 2023.12.12 https://github.com/riscv-collab/riscv-gnu-toolchain.git $TOOLCHAIN
git clone https://github.com/comparch-security/spike-virtio-devices.git $SPIKE_VIRTIO
#git clone https://github.com/comparch-security/speckle-2017.git $SPECKLE_REPO
git clone https://github.com/comparch-security/spike-sdk-spec2017 $SPIKE_SDK

# compile spike
install-spike

# compile riscv tool chain
install-riscv-toolchain

#install spike sdk
install-spike-sdk

