#!/bin/sh
#
# rename bt 

bt_name_path=/etc/bluetooth
mount -o remount,rw /
cp $bt_name_path/bt_app.conf $bt_name_path/bt_app.conf.back
sed -i "11c BtLocalDeviceName=$1" $bt_name_path/bt_app.conf.back
cp $bt_name_path/bt_app.conf.back $bt_name_path/bt_app.conf
rm $bt_name_path/bt_app.conf.back
systemctl restart btapp
mount -o remount,ro /

if [ -e /data/adk.connectivity.bt.db ];then
	adkcfg -f /data/adk.connectivity.bt.db write connectivity.bt.device_name "$1" --ignore
fi

sleep 0.5s

echo "OK"
