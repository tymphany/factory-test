#!/bin/sh

adk-message-monitor SystemModeManagement &
sleep 1
adk-message-send 'system_mode_management{name:"BatAct::getChargeLimit"}'
sleep 2
pkill -f adk-message-monitor

echo "done"


