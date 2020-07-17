#!/bin/sh
# set COUNTRY CODE to NVRAM
if [ -z "$2" ]; then
	echo "FAIL: Please input COUNTRY CODE! "
	exit 0
fi

sed -i "5s/.*/COUNTRY_CODE $1/g" $2


