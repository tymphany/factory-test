#!/bin/sh
# get BT0 MAC ADDR
macpath=/data/misc/bluetooth/.bt_nv.bin

#if [ -e $macpath ]; then
#	hexdump -C $macpath | cut -c 19-42 | awk '{printf("%s:%s:%s:%s:%s:%s", $6, $5, $4, $3, $2, $1);}'
#else
#	echo "bt0 using default mac address now"
#fi
getprop persist.vendor.service.bdroid.bdaddr 

# temporary disable nvram for EVT stage
# nvram read BT0_MAC_ADDR
echo " "

