#!/bin/sh
# set ASSEMBLY No. to /data/product/
if [ -z "$2" ]; then
	echo "FAIL: Please input ASSEMBLY No.! "
	exit 0
fi

sed -i "2s/.*/ASSEMBLY $1/g" $2
echo "$1" > /data/sn.txt
sync
#nvram write ASSEMBLY $1

