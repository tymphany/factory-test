#!/bin/sh
echo "Usage:record_play.sh  time(seconds) playfile volume"
mic_record_init.sh
mic_record_start.sh $1 &
play_file.sh $2 $3
