#!/bin/sh
# Factory reset

#enble amplifier at startup
rm /data/wpa_supplicant_home.conf
adkcfg -f data/adk.connectivity.states.db write connectivity.states.wifi_onboarded 0 --ignore
adkcfg -f data/adk.device.db reset device.friendly_name
/etc/initscripts/get_friendly_name.sh 2
adk-message-send 'connectivity_bt_clearpairedlist{}'
rm /data/bt_last_connected_address.txt
rm /data/mode
rm /data/airplay_data.txt
rm /data/source
rm -f /dev/shm/testing
rm -f /data/LOGs.txt
rm -f /data/tps65987-log.txt
rm -f /data/ota-file/AMPFailLog
/etc/factory-test/r1/set_volume.sh 0.4

echo "OK"
