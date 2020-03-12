#!/bin/sh
# Get MODEL

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/get_model_f.sh
exit $?
