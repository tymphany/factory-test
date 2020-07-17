#!/bin/sh
# set BOARD VERSION to NVRAM
if [ -z "$2" ]; then
	echo "FAIL: Please input BOARD VERSION! "
	exit 0
fi

sed -i "3s/.*/BOARD_VERSION $1/g" $2
#nvram write BOARD_VERSION $1

