#!/bin/sh
# Factory reset

#enble amplifier at startup
rm -f /dev/shm/testing
rm -f /data/LOGs.txt
rm -f /data/tps65987-log.txt
rm -f /data/ota-file/AMPFailLog
/etc/factory-test/r1/set_volume.sh 0.4

echo "OK"
