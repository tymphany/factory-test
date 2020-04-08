#!/bin/sh
# spdif on
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

echo "OK"
parec -d regular-spdif-in | pacat
