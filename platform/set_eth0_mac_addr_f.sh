#!/bin/sh
# set ETH0 MAC ADDR to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please input ETH0 MAC ADDR! "
	exit 0
fi

nvram write ETH0_MAC_ADDR $1

