#!/bin/sh
# set BT0 MAC ADDR to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please input BT0 MAC ADDR! "
	exit 0
fi

nvram write BT0_MAC_ADDR $1

