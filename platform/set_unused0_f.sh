#!/bin/sh
# set UNUSED0 to /data/product/
if [ -z "$2" ]; then
	echo "FAIL: Please UNUSED0! "
	exit 0
fi

sed -i "11s/.*/UNUSED0 $1/g" $2
