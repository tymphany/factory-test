#!/bin/sh
# set Wifi-1 MAC address to NVRAM and wifi driver
macpath=/persist/wlan_mac.bin
drvpath=/usr/lib/modules/4.14.117/extra/wlan.ko
if [ -z "$1" ]; then
	echo "FAIL: Please input MAC address! "
	exit 0
fi

nvram write wifi1_mac_addr $1

if [ -e $macpath ]; then
	oldmac=$(grep "Intf0MacAddress" $macpath | cut -d = -f2)
	sed -i "s/$oldmac/$1/g" $macpath
else
	touch $macpath
	echo "Intf0MacAddress=$1" > $macpath
	echo "END" >> $macpath	
fi

rmmod $drvpath
insmod $drvpath
