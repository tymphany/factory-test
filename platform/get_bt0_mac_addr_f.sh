#!/bin/sh
# get BT0 MAC ADDR

cat /persist/factory/bluetooth/bdaddr.txt
sync
sleep 0.3s
echo "sync"
