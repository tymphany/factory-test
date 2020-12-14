#!/bin/sh

i2cset -f -y 2 0x08 0x0a 1
sleep 1
i2cset -f -y 2 0x08 0x0a 0
echo "OK"
