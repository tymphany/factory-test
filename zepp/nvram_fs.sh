#!/bin/sh
# Formal NVRAM

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/formal_nvram.sh
exit $?
