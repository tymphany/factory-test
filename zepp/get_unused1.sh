#!/bin/sh
# Get UNUSED1

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/get_unused1_f.sh
exit $?
