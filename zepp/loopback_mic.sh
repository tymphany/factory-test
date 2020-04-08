#!/bin/sh
# loopback micphone
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

echo "OK"
$BASE_FOLD/platform/mic_loopback.sh

