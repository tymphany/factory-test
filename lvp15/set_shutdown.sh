#!/bin/sh
# Shutdown devices

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/set_shutdown_f.sh

if [ $? -eq 0 ]; then
        echo "OK"
fi
