#!/bin/sh
# enter factory test mode
SHELL_FOLD=$(dirname $0)
BASE_FOLD=$SHELL_FOLD/..

$BASE_FOLD/platform/enter_factory_mode_f.sh
