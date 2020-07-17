#!/bin/sh
# Get UNUSED1

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
FILE_PATH=/data/product/zepp.txt

$BASE_FOLD/platform/get_unused1_f.sh $FILE_PATH

exit $?
