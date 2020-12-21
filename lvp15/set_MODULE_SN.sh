#!/bin/sh

INFO_PATH=/persist/factory/product-message

if [ -z "$1" ]; then
	echo "FAIL: Please input MODUEL_SN! "
	exit 0
fi

sed -i "4c MODULE_SN $1" $INFO_PATH/lvp15.txt

echo OK

