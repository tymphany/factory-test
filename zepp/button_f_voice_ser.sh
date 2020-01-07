#!/bin/sh
# voice server button test
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
echo "voice server button test"
$BASE_FOLD/platform/button_f.sh 0071
exit $?
