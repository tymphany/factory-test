#!/bin/sh
# set MODEL name to /data/product
if [ -z "$2" ]; then
	echo "FAIL: Please input MODEL name! "
	exit 0
fi

sed -i "1s/.*/MODEL $1/g" $2
