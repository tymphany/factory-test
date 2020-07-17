#!/bin/sh
# set ETH0 MAC ADD to /data/product/
if [ -z "$2" ]; then
	echo "FAIL: Please input ETH0 MAC ADDR! "
	exit 0
fi

sed -i "7s/.*/ETH0_MAC_ADDR $1/g" $2

