#!/bin/sh
# get battery voltage
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/get_batt_voltage_f.sh

