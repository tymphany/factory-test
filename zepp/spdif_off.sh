#!/bin/sh
# spdif off
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

pkill -f parec
pkill -f pacat
pkill -f "spdif_on"

if [ $? -eq 0 ]; then 
	echo "OK"
fi
