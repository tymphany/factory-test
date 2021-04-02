#!/bin/sh
# enter factory test mode
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

#Disable amplifier
echo "" > /dev/shm/testing
adk-message-send 'system_mode_management {name: "Test::ForceOffLeds"}'
adk-message-send 'system_mode_management {name: "Test::enter_test_mode"}'
echo "OK"


#disable LED Pulsing function
#turn off usb led
adk-message-send 'led_start_pattern {pattern:33}'
#turn off action/vol-/playpause/vol+ led
adk-message-send 'led_start_pattern {pattern:16}'