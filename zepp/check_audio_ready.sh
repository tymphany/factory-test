#!/bin/sh
# check audio ready.

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

mount -o remount,rw /
$BASE_FOLD/platform/check_audio_ready_f.sh
mount -o remount,ro /