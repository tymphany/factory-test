#!/bin/sh
# Set system to burn in mode, and run burn in proce once when reboot.
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

mkdir -p /data/factory-test
cp -p $BASE_FOLD/platform/dsp_test /data/factory-test/dsp_test
cp -p $SHELL_FOLD/conf/burn_in.conf /data/factory-test/burn_in.conf
cp -p $SHELL_FOLD/conf/pinknosic.wav /data/factory-test/pinknosic.wav

