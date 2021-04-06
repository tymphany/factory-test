#set standby mode 
adk-message-send 'button_long_hold {button: "PLAYPAUSE"}'

if [ $? -eq 0 ]; 
then
    echo "OK"
else
	echo "FAIL"		
fi
