#!/bin/sh
echo "Usage:record_play.sh  time(seconds) playfile volume"
/etc/factory-test/r1/mic_record_init.sh
/etc/factory-test/r1/mic_record_start.sh $1 &
/etc/factory-test/r1/play_file.sh $2 $3
