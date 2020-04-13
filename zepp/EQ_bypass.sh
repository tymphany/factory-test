#!/bin/sh
# EQ bypass
#                      [chip addr]  [reg addr]     [data]
# i2ctransfer -y -f 2 w6@0xXX       0xXX 0xXX      0xXX 0xXX 0xXX 0xXX
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$SHELL_FOLD/znxg-cal.bin
# bypass crossover section
i2ctransfer -y -f 2 w6@0x3b  0x01 0xb9  0x00 0x00 0x00 0x00

# bypass DC filtering section
i2ctransfer -y -f 2 w6@0x3b  0x01 0xb1  0x00 0x00 0x00 0x00

if [ $? -eq 0 ]; then 
	echo "OK"
fi
