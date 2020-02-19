#!/bin/sh
# get battery capacity
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/get_batt_capacity_f.sh
