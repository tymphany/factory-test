#!/bin/sh
# get FP PART

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/get_fp_part_f.sh
exit $?
