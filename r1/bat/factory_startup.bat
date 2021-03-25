

:: disable write protection mode, needs to only run once
@adb wait-for-usb-device
@adb disable-verity
@adb shell /etc/exitscripts/board-script/reboot.sh
@adb wait-for-usb-device
@adb shell mount -o remount rw /



@adb shell /etc/factory-test/r1/enter_factory_mode.sh
@adb shell /etc/factory-test/r1/startup_led_button_test_wait.sh
@echo "---Press any key to start button/led test scripts---"
@pause
:: start button test scripts   
:: taking  around 13s to start Button
@adb shell /etc/factory-test/r1/button_f_check.sh
@adb shell /etc/factory-test/r1/set_lantern_on.sh
:: end of led,button test 



@echo "Press any key to enable amplifiers"
@pause
@echo Enabling AMPS
@adb shell /etc/initscripts/board-script/enable-amplifier.sh
@adb shell /etc/factory-test/r1/startup_speaker_test_wait.sh
::@echo "Press any key to start amplifier test scripts
@echo AMPS enabled

:: taking around 26s to start speaker
:: burn in test 
@adb shell /etc/factory-test/r1/set_burn_in.sh
:: end of speaker test


::@echo "Press any key to exit factory mode and do factory reset"
::@pause
@adb shell /etc/factory-test/r1/exit_factory_mode.sh
@adb shell /etc/factory-test/r1/factory_reset.sh
@echo OK
@echo "Press any key to quit"
@pause
