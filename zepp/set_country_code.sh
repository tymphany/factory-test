#!/bin/sh
# Set COUNTRY CODE

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/set_country_code_f.sh $1

if [ $? -eq 0 ]; then 
	echo "OK"
fi
