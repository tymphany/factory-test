#!/bin/sh
# set WLAN2 MAC address to /data/product/
if [ -z "$2" ]; then
	echo "FAIL: Please input WLAN2 MAC address! "
	exit 0
fi

sed -i "10s/.*/WLAN2_MAC_ADDR $1/g" $2

