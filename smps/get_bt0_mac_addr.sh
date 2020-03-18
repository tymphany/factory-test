#!/bin/sh
# get BT0 MAC ADDR

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/set_bt0_mac_addr_f.sh $1
exit $?
