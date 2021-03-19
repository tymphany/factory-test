#!/bin/sh
# Get WLAN0 MAC ADDR

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
FILE_PATH=/persist/factory/product-message/r1.txt

$BASE_FOLD/r1/get_wlan0_mac_addr_f.sh $FILE_PATH
exit $?
