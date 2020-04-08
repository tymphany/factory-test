#!/bin/sh
# play input file

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

echo "OK"

$BASE_FOLD/platform/audio_play_f.sh $1
