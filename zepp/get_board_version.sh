#!/bin/sh
# Get BOARD VERSION

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
FILE_PATH=/persist/factory/product-message/zepp.txt

$BASE_FOLD/platform/get_board_version_f.sh $FILE_PATH
exit $?
