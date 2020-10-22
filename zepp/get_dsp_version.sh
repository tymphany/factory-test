#!/bin/sh
# get DSP version
#                      [chip addr]  [reg addr]    
# i2ctransfer -y -f 2 w2@0xXX       0xXX 0xXX    r4
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

echo "DSP schematic version:"
i2ctransfer -y -f 2 w2@0x3b  0x01 0x9b r4

echo "DSP tuned version :"
i2ctransfer -y -f 2 w2@0x3b  0x02 0xbf r4
