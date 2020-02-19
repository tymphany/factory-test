#!/bin/sh
# get battery temperature
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/get_batt_temp_f.sh
