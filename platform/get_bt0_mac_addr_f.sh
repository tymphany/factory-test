#!/bin/sh
# get BT0 MAC ADDR

cat /persist/factory/product-message/lvp15_bdaddr.txt
sync
sleep 0.3s
echo "sync"
