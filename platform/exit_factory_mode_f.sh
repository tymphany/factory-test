#!/bin/sh
# move .db files from backup fold to /data, enable custom app, need reboot to apply it.

mv /data/db_bk/*.db /data
sync

echo OK
