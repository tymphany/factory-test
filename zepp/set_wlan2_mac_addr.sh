#!/bin/sh
# Set WLAN2 MAC ADDR

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/set_wlan2_mac_addr_f.sh $1

if [ $? -eq 0 ]; then 
	echo "OK"
fi
