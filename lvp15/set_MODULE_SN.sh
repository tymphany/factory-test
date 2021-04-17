#!/bin/sh

INFO_PATH=/persist/factory/product-message

if [ -z "$1" ]; then
	echo "FAIL: Please input MODUEL_SN! "
	exit 0
fi

if [ ! -f "$INFO_PATH/lvp15.txt" ]; then
   echo "Don't have lvp15.txt, touch new "
   echo "MODULE_SN $1" > $INFO_PATH/lvp15.txt
else
   echo "MODULE_SN $1" > $INFO_PATH/lvp15.txt
fi

sync
sleep 0.3s
echo "sync"
