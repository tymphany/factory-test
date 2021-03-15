#!/bin/sh
# set WLAN0 MAC address to NVRAM and wifi driver
mkpath=/persist/factory/wlan
macpath=$mkpath/wlan_mac.bin
drvpath=/usr/lib/modules/4.14.117/extra/wlan.ko
if [ -z "$1" ]; then
	echo "FAIL: Please input WLAN0 MAC address! "
	exit 0
fi

# temporary disable nvram for EVT stage
sed -i "8s/.*/WLAN0_MAC_ADDR $1/g" $2

if [ -e $macpath ]; then
	oldmac=$(grep "Intf0MacAddress" $macpath | cut -d = -f2)
	sed -i "s/$oldmac/$1/g" $macpath
else
	mkdir $mkpath
	touch $macpath
	write_addr=`echo $1 | sed 's/://g'`
	echo $write_addr
	echo "Intf0MacAddress=$write_addr" > $macpath
	echo "END" >> $macpath	
fi

rmmod $drvpath
insmod $drvpath
