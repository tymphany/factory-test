#!/bin/sh
# Get COUNTRY CODE

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/get_country_code_f.sh
exit $?
