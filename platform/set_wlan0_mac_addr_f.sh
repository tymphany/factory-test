#!/bin/sh
# set WLAN0 MAC address to NVRAM and wifi driver
mkpath=/persist/factory/wlan
macpath=$mkpath/wlan_mac.bin
drvpath=/usr/lib/modules/4.14.117-perf/extra/wlan.ko
if [ -z "$1" ]; then
	echo "FAIL: Please input WLAN0 MAC address! "
	exit 0
fi

if [ -e $macpath ]; then
        > $macpath
        write_addr=`echo $1 | sed 's/://g'`
        echo $write_addr
        echo "Intf0MacAddress=$write_addr" > $macpath
        echo "END" >> $macpath
else
	mkdir $mkpath
	touch $macpath
	write_addr=`echo $1 | sed 's/://g'`
	echo $write_addr
	echo "Intf0MacAddress=$write_addr" > $macpath
	echo "END" >> $macpath	
fi

echo $1 > /persist/factory/product-message/lvp15_wlan0.txt
sync
sleep 0.3s
echo "sync"
rmmod $drvpath
insmod $drvpath
