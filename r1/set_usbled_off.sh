#turn off usb led 
adk-message-send 'led_start_pattern {pattern:33}'

if [ $? -eq 0 ]; 
then
    echo "OK"
else
	echo "FAIL"		
fi

