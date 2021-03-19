#!/bin/sh

b=`i2ctransfer -y -f 5 w1@0x4d 0x03 r1`

val=$(($b))

val=$((val&0xF7))
val=$((val|($1<<3)))

b=`i2ctransfer -y -f 5 w2@0x4d 0x03 $val`

echo "done"
