#!/bin/sh
# Set FP PART

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/set_fp_part_f.sh $1
exit $?
