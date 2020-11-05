#!/bin/sh

a=`i2ctransfer -y -f 5 w1@0x49 0x00 r2`
temp1=${a:4}
temp2=${a:0:4}

b1=$(($temp2 * 255 + $temp1))

b1=$((b1 | 0xF0))
b1=$((b1 * 1000))
b1=$((b1 / 256))

a1=$((b1/1000))
a2=$((b1%1000))

echo "amp2 temp: $a1.$a2 C"


