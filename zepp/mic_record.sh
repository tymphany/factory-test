#!/bin/sh
# record 4 chnnal Audio to /data/factory-test/mic-4ch.wav

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
if [ -z "$1" ]; then 
	echo "FAIL: please input record time in S! "
	exit 0
fi

$SHELL_FOLD/mic_record_close.sh $1 &

echo "OK"
$BASE_FOLD/platform/mic_record_f.sh

