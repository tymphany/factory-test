#!/bin/sh
# get BT name

cat /etc/bluetooth/bt_app.conf | grep -r BtLocalDeviceName | awk -F "=" '{print $NF}'
