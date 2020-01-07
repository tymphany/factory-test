#!/bin/sh
# volume down test
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
echo "volume down button test"
$BASE_FOLD/platform/button_f.sh 0072
exit $?
