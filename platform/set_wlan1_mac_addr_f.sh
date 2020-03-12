#!/bin/sh
# set WLAN1 MAC address to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please input WLAN1 MAC address! "
	exit 0
fi

nvram write WLAN1_MAC_ADDR $1

