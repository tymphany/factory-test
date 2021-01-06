#!/bin/sh
# set BT MAC ADDR
# input formal:
# xx:xx:xx:xx:xx:xx
# example:
# 70:c9:4e:9b:64:11
# $1: addr
# $2: write path
# for adk 1.2 

if [ -z "$1" ]; then
        echo "FAIL: Please input BT MAC ADDR! examle: 70:c9:4e:9b:64:11"
        exit 0
fi

rm /data/misc/bluetooth/.bt_nv.bin
if [ ! -e /persist/factory/bluetooth/bdaddr.txt ]; then
        mkdir /persist/factory/bluetooth/
        touch /persist/factory/bluetooth/bdaddr.txt
fi

echo $1 > /persist/factory/bluetooth/bdaddr.txt
sed -i "13s/.*/BT0_MAC_ADDR $1/g" $2
 
adk-message-send 'connectivity_bt_disable{}'

sleep 3s

adk-message-send 'connectivity_bt_enable{}'


