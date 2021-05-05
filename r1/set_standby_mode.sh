#set standby mode 
adk-message-send 'system_mode_management{name: "btman::gotoStandby"}'

if [ $? -eq 0 ]; 
then
    echo "OK"
else
	echo "FAIL"		
fi
