#!/bin/sh
# button test
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
keylist=$SHELL_FOLD/conf/key_list.conf
echo "formation button test"

$BASE_FOLD/platform/button_f.sh $keylist
exit $?
