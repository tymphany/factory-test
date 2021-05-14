#!/bin/sh
a=`i2ctransfer -y 5 w1@0x38 0x06 r9`
b=${a:4}
c=${b:0:5}
echo "ver: $c" 


