#!/bin/sh
# volume up button
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
echo "volume up button "
$BASE_FOLD/platform/button_f.sh 0073
exit $?


