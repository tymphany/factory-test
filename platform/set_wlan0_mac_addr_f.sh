#!/bin/sh
# set WLAN0 MAC address to NVRAM and wifi driver
macpath=/persist/wlan_mac.bin
drvpath=/usr/lib/modules/4.14.117/extra/wlan.ko
if [ -z "$1" ]; then
	echo "FAIL: Please input WLAN0 MAC address! "
	exit 0
fi

# temporary disable nvram for EVT stage
# nvram write WLAN0_MAC_ADDR $1

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
