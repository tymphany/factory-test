#!/bin/sh
# exit factory test mode
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

#enble amplifier at startup
rm -f /dev/shm/testing
adk-message-send 'system_mode_management {name: "Test::ForceOnLeds"}'
/etc/initscripts/board-script/enable-amplifier.sh
adk-message-send 'system_mode_management {name: "Test::exit_test_mode"}'
echo "OK"
