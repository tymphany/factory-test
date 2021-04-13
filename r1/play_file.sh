#define 
#default volume value is max value
SOUND_VALUE=$2

if [ -z "$SOUND_VALUE" ]
then
	SOUND_VALUE=0
	echo "SOUND_VALUE: $SOUND_VALUE"
	echo "OK"
elif [ $SOUND_VALUE -gt 0 ] ||  [ $SOUND_VALUE -lt -120 ]
then
	echo "volume range -120 to 0"
	exit
else
	echo "OK"
fi

adk-message-send 'system_mode_management {name:"audio_Streaming"}'
sleep 0.7
gst-launch_64-1.0 filesrc location= $1 ! wavparse ! audioconvert mix-matrix="<<(float)1.0,(float)0.0>,<(float)0.0,(float)1.0>,<(float)1.0,(float)0.0>,<(float)0.0,(float)1.0>>" ! audio/x-raw,channels=4 ! flowdspgst port=54010 msg=set/GAIN_ST_1/gain/$SOUND_VALUE/   name="flowdsp" ! pulsesink
adk-message-send 'system_mode_management {name:"audio_Stoppped"}'


