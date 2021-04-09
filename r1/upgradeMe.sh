#!/bin/sh

function do_recovery() {
	mkdir -p /cache/recovery
	echo --update_package=/data/$1 > /cache/recovery/command
	echo "Begin to run recovery `date`"
	/usr/bin/recovery
	echo "Finish to run recovery `date`"
	tail -n 8 /cache/recovery/last_log | grep -q "Recovery exiting, upgrade success!"
	if [ $? -eq 0 ]; then
		echo "OTA success"
		sleep 2
		rm /cache/recovery -fr
		rm /data/$1
		echo "" > /data/ota-successed
		/etc/exitscripts/board-script/reboot.sh
	else
		echo "OTA fail"
	fi
	exit 0
}

/ota/ota-backups.sh

do_recovery $1
