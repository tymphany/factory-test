#!/bin/sh
# set FP PART to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please input FP PART! "
	exit 0
fi

nvram write FP_PART $1

