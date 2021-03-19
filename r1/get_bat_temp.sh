#!/bin/sh

a=`i2ctransfer -y -f 5 w1@0x0b 0x08 r2`
temp1=${a:4}
temp2=${a:0:4}

b1=$(($temp1 * 255 + $temp2 - 2730))

b1=$((b1/10))
b2=$((b1%10))
echo "temp: $b1.$b2 C" 


