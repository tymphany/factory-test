#!/bin/sh
# get ASSEMBLY No.

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
FILE_PATH=/data/product/zepp.txt

$BASE_FOLD/platform/get_assembly_f.sh $FILE_PATH
