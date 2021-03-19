#!/bin/sh
# Get COUNTRY CODE

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
FILE_PATH=/persist/factory/product-message/zepp.txt

$BASE_FOLD/platform/get_country_code_f.sh $FILE_PATH
exit $?
