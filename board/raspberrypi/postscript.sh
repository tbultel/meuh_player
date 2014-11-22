#!/bin/sh

TARGET="${1}"

# saves 90 secs
rm -f ${TARGET}/etc/systemd/system/getty.target.wants/serial-getty@.service

# copy System.map
cp ${TARGET}/../build/linux-*/System.map ${TARGET}/System.map

# copy kernel
cp ${TARGET}/../images/zImage ${TARGET}/../images/boot/kernel.img

exit 0

