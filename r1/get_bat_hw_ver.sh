#!/bin/sh

a=`i2ctransfer -y -f 5 w3@0x0b 0x00 0x03 0x00`
b=`i2ctransfer -y -f 5 w1@0x0b 0x23 r3`

b=${b:5}

echo "hw version: $b"