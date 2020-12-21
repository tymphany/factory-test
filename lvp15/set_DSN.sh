#!/bin/sh

INFO_PATH=/persist/factory/product-message

if [ -z "$1" ]; then
	echo "FAIL: Please input DSN! "
	exit 0
fi

sed -i "5c DEVICE_SN $1" $INFO_PATH/lvp15.txt

echo OK

