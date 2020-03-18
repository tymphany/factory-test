#!/bin/sh
# set factory test environment
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..
cd $SHELL_FOLD
chmod  +x *
cd $BASE_FOLD/platform
chmod +x *
cd $SHELL_FOLD
