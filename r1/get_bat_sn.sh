#!/bin/sh

a=`i2ctransfer -y -f 5 w1@0x0b 0x1c r2`

temp1=${a:4}
temp2=${a:0:4}

b1=$(($temp1 * 255 + $temp2))

echo "battery sn: $b1" 


