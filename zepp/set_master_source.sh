#!/bin/sh
# set master source
#                      [chip addr]  [reg addr]     [data]
# i2ctransfer -y -f 2 w6@0xXX       0xXX 0xXX      0xXX 0xXX 0xXX 0xXX
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

case $1 in
	soc)
	source=0x02
	;;
	local)
	source=0x00
	;;
	spdif)
	source=0x04
	;;
	*)
	echo "FAIL: unknow source !"
	exit 1
	;;
esac

i2ctransfer -y -f 2 w6@0x3b  0x01 0xb0  0x00 0x00 0x00 $source

if [ $? -eq 0 ]; then 
	echo "OK"
fi
