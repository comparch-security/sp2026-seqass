#!/usr/bin/bash
set -x

# get all variables
source env.sh

# prepare the OS
sudo apt-get -y install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev libglib2.0-dev sshfs device-tree-compiler libboost-regex-dev libboost-system-dev libboost-program-options-dev python3-dev unzip libpixman-1-dev rsync wget cpio python3-numpy python3-matplotlib gnuplot

# artifact
git clone --recurse-submodules --branch sp2026-seqass https://github.com/comparch-security/spike-flexicas.git $SPIKE

# infrastructure
git clone https://github.com/comparch-security/spike-virtio-devices.git $SPIKE_VIRTIO

# compile spike
install-spike
