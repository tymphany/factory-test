#!/bin/sh
# get BT0 MAC ADDR

cat /persist/factory/bluetooth/bdaddr.txt
sed -n "13p" $1
