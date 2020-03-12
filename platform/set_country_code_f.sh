#!/bin/sh
# set COUNTRY CODE to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please input COUNTRY CODE! "
	exit 0
fi

nvram write COUNTRY_CODE $1

