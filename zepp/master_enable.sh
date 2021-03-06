#!/bin/sh
# master enable
# MASTERMUTE
#                      [chip addr]  [reg addr]     [data]
# i2ctransfer -y -f 2 w6@0xXX       0xXX 0xXX      0xXX 0xXX 0xXX 0xXX
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

i2ctransfer -y -f 2 w6@0x3b  0x02 0x93  0x01 0x00 0x00 0x00

if [ $? -eq 0 ]; then 
	echo "OK"
fi
