#!/bin/sh
# read software version

SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

cat /etc/sw-version.conf
