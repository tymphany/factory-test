#!/bin/sh
#
# rename bt 

bt_name_path=/etc/bluetooth
cp $bt_name_path/bt_app.conf /data
sed -i "11c BtLocalDeviceName=$1" /data/bt_app.conf
cp /data/bt_app.conf $bt_name_path
rm /data/bt_app.conf
systemctl restart btapp

if [ -e /data/adk.connectivity.bt.db ];then
	adkcfg -f /data/adk.connectivity.bt.db write connectivity.bt.device_name "$1" --ignore
fi

sleep 0.5s

echo "OK"
