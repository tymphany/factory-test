#!/bin/sh
# spdif off
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/spdif_off_f.sh

if [ $? -eq 0 ]; then 
	echo "OK"
fi
