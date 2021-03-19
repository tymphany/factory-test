#!/bin/sh

INFO_PATH=/persist/factory/product-message

if [ -z "$1" ]; then
	echo "FAIL: Please input DSN! "
	exit 0
fi

if [ ! -f "$INFO_PATH/lvp15_DEVICE_SN.txt" ]; then
   touch $INFO_PATH/lvp15_DEVICE_SN.txt
   echo "Don't have lvp15.txt, touch new "
   echo "DEVICE_SN $1" > $INFO_PATH/lvp15_DEVICE_SN.txt
else
   echo "DEVICE_SN $1" > $INFO_PATH/lvp15_DEVICE_SN.txt
fi

sync
echo OK
