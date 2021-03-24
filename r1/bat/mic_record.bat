:: please put this bat file in adb tool folder

::synchronizing mic initialzation and mic recording
@adb wait-for-usb-device

::mic initializing first 
@adb shell /etc/factory-test/r1/mic_record_init.sh

::after initlizition
:: the first parameter is the recording time (s)
@adb shell /etc/factory-test/r1/mic_record_start.sh  %1

