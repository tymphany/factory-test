#!/bin/sh
# set UNUSED1 to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please UNUSED1! "
	exit 0
fi

nvram write UNUSED1 $1

