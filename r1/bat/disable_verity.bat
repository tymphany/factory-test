:: This bat file only for solving write protection problem, only need to run once. 

::please put this bat file to adb tool folder, and run it
@adb wait-for-usb-device
@adb disable-verity

::reboot method: if it works, do not need to use the shutdown method 
@adb shell /etc/exitscripts/board-script/reboot.sh

::shutdown method: if the reboot.sh cannot work, just using shutdown command below, adding "::" before reboot.sh bommand
::@adb shell /etc/exitscripts/board-script/shutdown.sh

::if the reboot function cannot work, you have to power on the machine manually, after then running two commands below
@adb wait-for-usb-device
@adb shell mount -o remount rw /
