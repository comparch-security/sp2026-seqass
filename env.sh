#!/usr/bin/bash

export ROOT=$PWD
export RISCV=$ROOT/infrastructure/riscv
export SPIKE=$ROOT/artifact/spike-flexicas
export BALL_TEST=$ROOT/artifact/ball-test
export CM=$SPIKE/flexicas
export TOOLCHAIN=$ROOT/infrastructure/riscv-gnu-toolchain
export SPIKE_VIRTIO=$ROOT/infrastructure/spike-virtio-devices
export SPECKLE_REPO=$ROOT/infrastructure/speckle-2017
export SPECKLE=$SPECKLE_REPO/build/overlay
export SPIKE_SDK=$ROOT/infrastructure/spike-sdk-spec2017

export PATH=$PATH:$ROOT/bin:$RISCV/bin

alias xterm-spec='xterm -e /usr/bin/bash -c "spike-spec"'
alias xterm-mcore='xterm -e /usr/bin/bash -c "spike-mcore"'
