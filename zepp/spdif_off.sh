#!/bin/sh
# spdif off
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

pkill -f "spdif_on"
