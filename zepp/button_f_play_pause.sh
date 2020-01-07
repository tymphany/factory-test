#!/bin/sh
# play/pause button test
echo "play/pause button test"
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
$BASE_FOLD/platform/button_f.sh 00a4
exit $?
