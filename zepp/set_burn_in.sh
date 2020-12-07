#!/bin/sh
# Set system to burn in mode, and run burn in proce once when reboot.
# ./set_burn_in.sh max
# $1 is times

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

mount -o remount,rw /
echo $1 > $SHELL_FOLD/conf/burn_in.conf
mkdir -p /data/factory-test
cp -p $SHELL_FOLD/conf/burn_in.conf /data/factory-test/burn_in.conf
cp -p $BASE_FOLD/platform/data/pinknoise.wav /data/factory-test/pinknoise.wav
echo max > $SHELL_FOLD/conf/burn_in.conf
sync
mount -o remount,ro /

if [ $? -eq 0 ]; then 
	echo "OK"
fi
