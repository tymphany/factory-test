#define 
#default volume value is max value
sound_value="0"
input_value=$2

if [ $input_value -ge 10 ];then
	sound_value="0"
elif [ $input_value -ge 9 ];then
	sound_value="-10"	
elif [ $input_value -ge 7 ];then
	sound_value="-20"
elif [ $input_value -ge 5 ];then
	sound_value="-40"
elif [ $input_value -ge 3 ];then
	sound_value="-60"
elif [ $input_value -ge 1 ];then
	sound_value="-80"
else
	sound_value="-120"
fi

adk-message-send 'system_mode_management {name:"audio_Streaming"}'
sleep 0.7

gst-launch_64-1.0 filesrc location= $1 ! wavparse ! audioconvert mix-matrix="<<(float)1.0,(float)0.0>,<(float)0.0,(float)1.0>,<(float)1.0,(float)0.0>,<(float)0.0,(float)1.0>>" ! audio/x-raw,channels=4 ! flowdspgst port=54010 msg=set/GAIN_ST_1/gain/$sound_value/   name="flowdsp" ! pulsesink

adk-message-send 'system_mode_management {name:"audio_Stoppped"}'

