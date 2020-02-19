#!/bin/sh
# get battery current
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/get_batt_current_f.sh
