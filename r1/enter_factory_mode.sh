#!/bin/sh
# enter factory test mode
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

#Disable amplifier
echo "" > /dev/shm/testing
#turn off action/vol-/playpause/vol+/Lantern/Mute
adk-message-send 'system_mode_management {name: "Test::ForceOffLeds"}'
#turn off usb led
adk-message-send 'led_start_pattern {pattern:33}'
#jump in factory test mode
adk-message-send 'system_mode_management {name: "Test::enter_test_mode"}'
echo "OK"