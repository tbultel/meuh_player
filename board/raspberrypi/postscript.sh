#!/bin/sh

TARGET="${1}"

# saves 90 secs
rm -f ${TARGET}/etc/systemd/system/getty.target.wants/serial-getty@.service

# copy System.map
cp ${TARGET}/../build/linux-*/System.map ${TARGET}/System.map

# This is a nasty workaround. For unknwown reason, the target/bin/busybox
# is deleted during the build. Fix it buy copying the one from
# target/usr/bin/busybox (they are identical)

cp ${TARGET}/usr/bin/busybox ${TARGET}/bin

exit 0

