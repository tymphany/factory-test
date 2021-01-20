#!/bin/sh
# Factory reset

#enble amplifier at startup
rm -f /dev/shm/testing
/etc/factory-test/r1/set_volume.sh 0.4

echo "OK"
