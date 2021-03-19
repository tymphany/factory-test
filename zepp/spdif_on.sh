#!/bin/sh
# spdif on
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/spdif_on_f.sh 
echo "OK"
