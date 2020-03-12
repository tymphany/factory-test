#!/bin/sh
# set UNUSED0 to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please UNUSED0! "
	exit 0
fi

nvram write UNUSED0 $1

