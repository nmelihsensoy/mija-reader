# Mija Reader

Pvvx firmware offers many useful features for Xiaomi Mija thermometers and Advertising Mode is one of them. In this mode, measurements are broadcast through the BLE advertising packet to eliminate connection requirement to save power.

This utility allows to acquire the measurements from the thermometer device passively in Raspberry PI or other Linux distributions.

## Build

Install dependencies.

```
sudo apt-get install libbluetooth-dev
```

Start building

```
cc mija-reader.c -lbluetooth -o mija-reader
```

## Run

```
> sudo ./mija-reader <MAC ADDRESS>
Temp: 23.80°C, Humi: 57.24%, Bat: 82%
```

## Publish Measurements with MQTT

`mqtt-publish.sh`

```
MAC_ADDR=<DEVICE_MAC_ADDRESS>
MQTT_HOST=<MQTT_BROKER>
MQTT_TOPIC=<TOPIC_NAME>
INTERVAL=<PUBLISHIG_INTERVAL>
```
Edit these variables with yours then execute `sudo ./mqtt-publish.sh`

## Credits

* Code is derived from Damian Kolakowski's BLE scan example.
https://github.com/damian-kolakowski/intel-edison-playground/blob/master/scan.c

* https://github.com/pvvx/ATC_MiThermometer