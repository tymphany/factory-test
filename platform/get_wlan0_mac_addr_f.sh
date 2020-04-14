#!/bin/sh
# get WLAN0 MAC address

macpath=/persist/wlan_mac.bin

if [ -e $macpath ]; then
	macaddr=$(grep "Intf0MacAddress" $macpath | cut -d = -f2)
	echo "$macaddr"
else
	echo "Wlan0 using default mac address now"
fi
# temporary disable nvram for EVT stage
# nvram read WLAN0_MAC_ADDR
echo " "
