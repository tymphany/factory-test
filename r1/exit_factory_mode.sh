#!/bin/sh
# exit factory test mode
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/exit_factory_mode_f.sh

if [ $? -eq 0 ]; then 
	echo "OK"
fi

#systemctl restart led-manager
adk-message-send 'system_mode_management {name: "trigger::audio_init_complete"}'