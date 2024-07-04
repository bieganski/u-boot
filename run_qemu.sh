#!/bin/bash

set -eu

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

QEMU=/home/mateusz/tb/github/qemu/build/qemu-system-aarch64
KERNEL=$SCRIPT_DIR/u-boot.bin

set -x

sudo $QEMU \
	-m 2G \
	-cpu cortex-a72 \
	-kernel linux-stable/arch/arm64/boot/Image -append root=PARTUUID=d97f5830-02 rw console=ttyAMA0 -serial telnet:localhost:4321,server,nowait -monitor telnet:localhost:4322,server,nowait -device VGA,id=vga1 -device secondary-vga,id=vga2 -object iothread,id=io1 -device virtio-blk-pci,drive=disk0,iothread=io1 -drive data/images/2022-01-28-raspios-bullseye-arm64.img
