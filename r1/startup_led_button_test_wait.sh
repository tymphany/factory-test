R1SYSMODE="Off"
while [ ! -f /dev/shm/r1SysState ];
do
sleep 0.5
done

while [ $R1SYSMODE == "Off" ];
do
    read R1SYSMODE < /dev/shm/r1SysState
    sleep 0.5
done