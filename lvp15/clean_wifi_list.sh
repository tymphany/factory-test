#!/bin/sh
#
# clean wifi list 

adk-message-send 'connectivity_wifi_onboard{}'
sleep 5s

status=`wpa_cli status|grep wpa_state`
ok_status="wpa_state=DISCONNECTED"

if [ "$status" = "$ok_status" ]; then
	echo OK
else
	echo FAILED
fi
