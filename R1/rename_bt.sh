#!/bin/sh
#
# rename bt 

adkcfg -f /data/adk.connectivity.bt.db write connectivity.bt.device_name "$1" --ignore

sleep 0.5s

echo "OK"
