#!/bin/sh
# Shutdown devices

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

i2ctransfer -y 5 w3@0x6b 0x00 0x2e 0x86
sleep 0.5
/etc/factory-test/r1/set_bat_shutdown.sh

sleep 1

$BASE_FOLD/platform/set_shutdown_f.sh

if [ $? -eq 0 ]; then
        echo "OK"
fi
