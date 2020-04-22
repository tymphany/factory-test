#!/bin/sh
# record 4 chnnal Audio to /data/factory-test/mic-4ch.wav

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

if [ -z "$1" ]; then
	echo "Fail: Please input record time"
	exit 0
fi

echo "OK"
$BASE_FOLD/platform/mic_record_f.sh $1

