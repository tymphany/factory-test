#!/bin/sh
# get BT name

/etc/initscripts/get_friendly_name.sh 0

#cat /etc/bluetooth/bt_app.conf | grep -r BtLocalDeviceName | awk -F "=" '{print $NF}'
