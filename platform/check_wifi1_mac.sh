#!/bin/sh
#check the wifi1 mac address, if not exist set it.
macpath=/persist/wlan_mac.bin
drvpath=/usr/lib/module/4.14.117.extra/wlan.ko

if [ -e $macpath ]; then
	exit 1
fi  

mac=$(nvram read wifi1_mac_addr)
touch $macpath
echo "Intf0MacAddress=$mac" > $macpath
echo "END" >> $macpath

rmmod $drvpath
insmod $drvpath
