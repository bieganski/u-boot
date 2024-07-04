#!/bin/bash

set -eux

export CROSS_COMPILE=aarch64-linux-gnu-

# make rpi_4_defconfig
make -j20
