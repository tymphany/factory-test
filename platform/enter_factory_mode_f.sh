#!/bin/sh
# move system .db to backup fold to disable custom app for factory test, need reboot to apply
mkdir -p /data/db_bk

mv /data/*.db /data/db_bk
#mv /data/adk.connectivity.*.db /data/db_bk
#mv /data/adk.button.db /data/db_bk
#mv /data/adk.led.db /data/db_bk
#mv /data/allplay.db /data/db_bk
#mv /data/spotify.db /data/db_bk
sync

pkill led-manager

