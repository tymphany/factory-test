#!/bin/sh
# get WLAN0 MAC address

mkpath=/persist/factory/wlan
macpath=$mkpath/wlan_mac.bin

if [ -e $macpath ]; then
	macaddr=$(grep "Intf0MacAddress" $macpath | cut -d = -f2)
	echo "$macaddr"
else
	echo "Wlan0 using default mac address now"
fi

sync
sleep 0.3s
echo "sync ok"
