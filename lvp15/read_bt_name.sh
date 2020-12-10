#!/bin/sh
#
# read bt name 

#adkcfg -f /data/adk.connectivity.bt.db read connectivity.bt.device_name

cat /etc/bluetooth/bt_app.conf | grep -r BtLocalDeviceName | awk -F "=" '{print $NF}'
