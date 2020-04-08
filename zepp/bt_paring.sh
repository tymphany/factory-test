#!/bin/sh
# start bt paring

adk-message-send 'connectivity_bt_setdiscoverable {timeout:300}'

if [ $? -eq 0 ]; then 
	echo "OK"
fi

