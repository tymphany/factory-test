adk-message-send 'system_mode_management {name:"audio_Streaming"}'
gst-launch_64-1.0 filesrc location= $1 ! wavparse ! audioconvert mix-matrix="<<(float)1.0,(float)0.0>,<(float)0.0,(float)1.0>,<(float)1.0,(float)0.0>,<(float)0.0,(float)1.0>>" ! audio/x-raw,channels=4 ! flowdspgst port=50013 name="flowdsp" ! pulsesink
adk-message-send 'system_mode_management {name:"audio_Stoppped"}'

