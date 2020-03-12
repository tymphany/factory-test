#!/bin/sh
# set BOARD VERSION to NVRAM
if [ -z "$1" ]; then
	echo "FAIL: Please input BOARD VERSION! "
	exit 0
fi

nvram write BOARD_VERSION $1

