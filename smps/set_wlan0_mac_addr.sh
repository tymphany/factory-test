#!/bin/sh
# Set WLAN0 MAC ADDR

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/set_wlan0_mac_addr_f.sh $1
exit $?
