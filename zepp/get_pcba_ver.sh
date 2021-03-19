#!/bin/sh
# Get PCBA ver  (board ID)

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/get_pcba_ver_f.sh
exit $?

