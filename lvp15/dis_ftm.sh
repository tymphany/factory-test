#!/bin/sh
# disable Wifi/BT FTM  (factory test mode)

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/dis_ftm_f.sh

if [ $? -eq 0 ]; then 
	echo "OK"
fi

