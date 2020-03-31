#!/bin/sh
# move system .db to backup fold to disable custom app for factory test, need reboot to apply
mkdir -p /data/db_bk

mv /data/adk.led.db /data/db_bk

