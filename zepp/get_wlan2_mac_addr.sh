#!/bin/sh
# Get WLAN2 MAC ADDR

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/get_wlan2_mac_addr_f.sh
exit $?
