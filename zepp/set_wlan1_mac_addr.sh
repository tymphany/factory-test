#!/bin/sh
# Set WLAN1 MAC ADDR

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
FILE_PATH=/persist/factory/product-message/zepp.txt

$BASE_FOLD/platform/set_wlan1_mac_addr_f.sh $1 $FILE_PATH

if [ $? -eq 0 ]; then 
	echo "OK"
fi
