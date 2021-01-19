#!/bin/sh
# enter factory test mode
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

#Disable amplifier
echo "" > /dev/shm/disTone
adk-message-send 'system_mode_management {name: "Test::ForceOffLeds"}'

echo "OK"
