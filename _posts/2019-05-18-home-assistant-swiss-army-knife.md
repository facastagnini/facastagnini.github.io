---
layout: post
title: Home Assistant Swiss army knife
published: false
fullview: false
description: DIY multi sensor home baseline box.
tags:
- esp8266
- home-assistant
- tasmota
---
# Why...
Home automation is adictive...once you have your first device using mqtt to do something, it's a slipery slope. You will start integrating everything, and since there is so much diversity of devices in your house, you will need a bunch of sensors and communication technologies.
This is a standard box that I am placing on every room of the house to have a baseline of capabilities:
- temperature and humidity (AM2302)
- light sensor (TSL2561)
- microwave radar movement sensor ([RCWL-0516]) (how to use it https://github.com/arendst/Sonoff-Tasmota/wiki/Wemos-D1-Mini-and-RCWL-0516-Microwave-Radar-Sensor) (review https://www.youtube.com/watch?v=IJoPkKlxFXA)
- [315Mhz RF transmitter and receiver]

## Next steps:
- Carbon Monoxide gas and combustible gas sensor (MQ-9)
  MQ-9 gas sensor for carbon monoxide, methane, liquefied petroleum gas, the sensor can detect a variety of gases containing carbon monoxide and flammable.
  Carbon monoxide can be tested 10 to 1000ppm CO, combustible gas range 100 to 10000ppm.
- Smoke detector (MQ-135)
  Probe for home, environmental harmful gas detection device , suitable to ammonia , aromatic compounds , sulfur compounds , benzene vapor , smoke and other gases harmful gases , the gas sensitive element concentration range : 10 to 1000ppm
- IR transceiver?

[RCWL-0516]: https://www.aliexpress.com/item/RCWL-0516-microwave-radar-sensor-module-Human-body-induction-switch-module-Intelligent-sensor/32704946341.html
[TSL2561]: https://www.ebay.com/itm/TSL2561-Luminosity-Sensor-Breakout-infrared-Light-Sensor-Integrating-Sensor/264220584042
[AM2302]: https://www.aliexpress.com/item/5PCS-10PCS-lot-DHT22-AM2302-digital-temperature-and-humidity-sensor-Temperature-and-humidity-module-replace-SHT11/32896608843.html
[315Mhz RF transmitter and receiver]: https://www.ebay.com/itm/315Mhz-RF-transmitter-and-receiver-link-kit-for-Arduino-ARM-MCU-NEW/141977598098

# Hardware
## list of components used
- 

## Wiring
I put it together like this: [todo insert picture of diagram]

# Software
## microcontrolled side
- [Flash Tasmota]
- backlog of baseline config for every microcontroller I use 'Backlog mqtthost <MQTT_FQDN_OR_IP>; mqttuser <MQTT_USER>; mqttpassword <MQTT_PASSWORD>; hostname <DEVICE_NAME>; topic <DEVICE_NAME>; FriendlyName1 <DEVICE_NAME>;setoption53 1; SetOption19 1' I called mine after the rooms they are in, today I will call it 'garage_toolbox'.
- configure a generic module and map the sensors
- configure the motion detector mqtt topic 'backlog switchtopic2 garage_toolbox_motion_detector; SwitchMode2 1'

[Flash Tasmota]: https://github.com/arendst/Sonoff-Tasmota/wiki/Wemos%20D1%20Mini#using-esptoolpy

## home assistant configuration
- configure an alias for the motion switch

/config/customize.yaml
binary_sensor.sonoff2_sw:
  device_class: motion
  friendly_name: garage_toolbox motion detector
