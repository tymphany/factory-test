#!/bin/sh
# connect wifi 

adk-message-send 'connectivity_wifi_onboard{}'
sleep 1s
adk-message-send "connectivity_wifi_connect {ssid:'$1'password:'$2' homeap:true}"
sleep 5s
adk-message-send 'connectivity_wifi_completeonboarding{}'
sleep 10s