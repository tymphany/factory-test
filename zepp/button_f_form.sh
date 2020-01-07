#!/bin/sh
# formation button test
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
echo "formation button test"
$BASE_FOLD/platform/button_f.sh 0066
exit $?
