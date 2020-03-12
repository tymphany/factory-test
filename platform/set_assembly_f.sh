#!/bin/sh
# set ASSEMBLY No. to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please input ASSEMBLY No.! "
	exit 0
fi

nvram write ASSEMBLY $1

