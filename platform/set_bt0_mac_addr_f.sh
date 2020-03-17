#!/bin/sh
# set BT0 MAC ADDR to NVRAM
# input formal:
# xx:xx:xx:xx:xx:xx
# exp:
# 70:c9:4e:9b:64:11
if [ -z "$1" ]; then
	echo "FAIL: Please input BT0 MAC ADDR! "
	exit 0
fi

nvram write BT0_MAC_ADDR $1
rm /data/misc/bluetooth/.bt_nv.bin
btnvtool -b $1
adk-message-send 'connectivity_bt_disable{}'
adk-message-send 'connectivity_bt_enable{}'
