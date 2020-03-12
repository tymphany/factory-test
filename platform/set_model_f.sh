#!/bin/sh
# set MODEL name to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please input MODEL name! "
	exit 0
fi

nvram write MODEL $1

