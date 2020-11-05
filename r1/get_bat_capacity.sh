#!/bin/sh

b=`i2ctransfer -y -f 5 w1@0x0b 0x0d r1`
cap=$(($b))

echo "capacity: $cap" 



