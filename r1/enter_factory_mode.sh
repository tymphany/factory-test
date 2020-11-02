#!/bin/sh
# enter factory test mode
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

adk-message-send 'system_mode_management {name: "Test::ForceOffLeds"}'

echo "OK"
