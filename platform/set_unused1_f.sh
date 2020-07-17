#!/bin/sh
# set UNUSED1 to /data/product/
if [ -z "$2" ]; then
	echo "FAIL: Please UNUSED1! "
	exit 0
fi

sed -i "12s/.*/UNUSED1 $1/g" $2
