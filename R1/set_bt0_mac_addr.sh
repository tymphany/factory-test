#!/bin/sh
# Set BT0 MAC ADDR

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
#FILE_PATH=/data/product/zepp.txt

if [ -z "$1" ]; then
        echo "FAIL: Please input BT MAC ADDR! examle: 70:c9:4e:9b:64:11"
        exit 0
fi

$BASE_FOLD/platform/set_bt0_mac_addr_f.sh $1

if [ $? -eq 0 ]; then 
	echo "OK"
fi
