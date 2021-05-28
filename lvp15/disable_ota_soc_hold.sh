#!/bin/sh
# set low the cypress pin

i2cset -f -y 2 0x08 0x0d 0
sleep 1
echo "OK"
