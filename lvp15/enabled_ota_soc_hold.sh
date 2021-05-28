#!/bin/sh
#set high cypress pin

i2cset -f -y 2 0x08 0x0d 1
sleep 1
echo "OK"
