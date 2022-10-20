#!/bin/bash

MAC_ADDR="A4:C1:38:C4:CA:33"
MQTT_HOST="10.0.0.4"
MQTT_TOPIC="outMeasures"
INTERVAL=30

while true; do
    mija_output=`sudo ./mija-reader $MAC_ADDR`
    temp=`echo $mija_output | cut -d ',' -f 1 | egrep -o '[0-9]+\.?[0-9]+'`
    hum=`echo $mija_output | cut -d ',' -f 2 | egrep -o '[0-9]+\.?[0-9]+'`
    bat=`echo $mija_output | cut -d ',' -f 3 | egrep -o '[0-9]+\.?[0-9]+'`

    MSG=\''{"temp": '$temp',"hum": '$hum',"bat": '$bat'}'\'
        MSG=${MSG#\'}
        MSG=${MSG%\'}
        echo "$MSG"
        mosquitto_pub -h $MQTT_HOST -t $MQTT_TOPIC -m "$MSG"
    sleep $(( $INTERVAL ))
done