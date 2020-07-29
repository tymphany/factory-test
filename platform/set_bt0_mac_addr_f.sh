#!/bin/sh
# set BT MAC ADDR
# input formal:
# xx:xx:xx:xx:xx:xx
# example:
# 70:c9:4e:9b:64:11
if [ -z "$1" ]; then
        echo "FAIL: Please input BT MAC ADDR! examle: 70:c9:4e:9b:64:11"
        exit 0
fi

rm /data/misc/bluetooth/.bt_nv.bin
echo $1 > /persist/factory/bluetooth/bdaddr.txt

adk-message-send 'connectivity_bt_disable{}'

sleep 3s

adk-message-send 'connectivity_bt_enable{}'

echo "ok"

