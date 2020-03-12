#!/bin/sh
# set BASE MAC ADDR to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please input BASE MAC ADDR! "
	exit 0
fi

nvram write BASE_MAC_ADDR $1

