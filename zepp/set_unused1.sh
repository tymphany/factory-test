#!/bin/sh
# Set UNUSED1

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
FILE_PATH=/persist/factory/product-message/zepp.txt

$BASE_FOLD/platform/set_unused1_f.sh $1 $FILE_PATH

if [ $? -eq 0 ]; then 
	echo "OK"
fi
