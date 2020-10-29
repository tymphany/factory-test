adb wait-for-usb-device
adb shell mount -o remount rw /
adb push %1 %2