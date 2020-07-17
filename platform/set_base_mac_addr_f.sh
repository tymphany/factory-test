#!/bin/sh
# set BASE MAC ADDR to NVRAM
if [ -z "$2" ]; then
	echo "FAIL: Please input BASE MAC ADDR! "
	exit 0
fi

sed -i "6s/.*/BASE_MAC_ADDR $1/g" $2
#nvram write BASE_MAC_ADDR $1

