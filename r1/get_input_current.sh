#!/bin/sh
a=`i2ctransfer -y -f 5 w1@0x6b 0x2A r2`

current=$((((${a:4})) *(50)))

echo "current: $current mA"

