#!/bin/sh

a=`i2ctransfer -y -f 5 w1@0x0b 0x0A r2`

temp1=${a:4}
temp2=${a:0:4}

b1=$(($temp1 * 255 + $temp2))

if [ $b1 -gt 32768 ]
then
	b1=$((b1 ^ 65535))
	b1=$((-1 * b1))
fi

echo "current: $b1 mA" 


