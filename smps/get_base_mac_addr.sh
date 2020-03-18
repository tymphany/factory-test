#!/bin/sh
# Get BASE MAC ADDR

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/Get_base_mac_addr_f.sh
exit $?
