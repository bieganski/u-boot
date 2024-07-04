#!/bin/bash

set -eu

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

QEMU=/home/mateusz/tb/github/qemu/build/qemu-system-aarch64
KERNEL=$SCRIPT_DIR/u-boot.bin
DTB=$SCRIPT_DIR/arch/arm/dts/bcm2711-rpi-4-b.dtb

DTB=$SCRIPT_DIR/REAL.bcm2711-rpi-4-b.dtb

set -x

sudo $QEMU \
	-m 2G \
	-machine raspi4b \
	-cpu cortex-a72 \
	-serial mon:stdio \
	-dtb $DTB \
	-kernel $KERNEL \
	-nographic \
	--trace 'memory_region_ops_*'
	
# -monitor telnet:localhost:4322,server,nowait 