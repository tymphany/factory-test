#!/bin/sh

i2ctransfer -y 5 w3@0x6b 0x3a 0xFF 0xE0

a=`i2ctransfer -y -f 5 w1@0x6b 0x2A r2`

current=$((((${a:4})) *(50)))

echo "current: $current mA"

