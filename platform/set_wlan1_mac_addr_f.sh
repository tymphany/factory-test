#!/bin/sh
# set WLAN1 MAC address to NVRAM
if [ -z "$2" ]; then
	echo "FAIL: Please input WLAN1 MAC address! "
	exit 0
fi

sed -i "9s/.*/WLAN1_MAC_ADDR $1/g" $2

