#!/bin/sh
# exit factory test mode
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

#enble amplifier at startup
rm -f /dev/shm/disTone
adk-message-send 'system_mode_management {name: "Test::ForceOnLeds"}'

echo "OK"
