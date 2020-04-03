#!/bin/sh
# spdif on
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

parec -d regular-spdif-in | pacat
