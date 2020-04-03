#!/bin/sh
# close mic record
PID=$(ps -e | grep tinycap | awk '1==NR{printf $1}')

kill -2 $PID

pkill -f "mic_record"
