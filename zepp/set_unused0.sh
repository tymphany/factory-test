#!/bin/sh
# Set UNUSED0

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/set_unused0_f.sh $1

if [ $? -eq 0 ]; then 
	echo "OK"
fi
