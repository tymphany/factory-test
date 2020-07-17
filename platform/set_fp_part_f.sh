#!/bin/sh
# set FP PART to NVRAM
if [ -z "$2" ]; then
	echo "FAIL: Please input FP PART! "
	exit 0
fi

sed -i "4s/.*/FP_PART $1/g" $2

