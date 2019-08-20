---
layout: post
title: Home Assistant Swiss army knife
published: true
fullview: false
description: DIY multi sensor home baseline box.
tags:
- esp8266
- home-assistant
- esphome
---
# Why...
Home automation is adictive...once you have your first device installed, it's a slipery slope. You will start integrating everything, and since there is so much diversity of devices in your house, you will need a bunch of sensors and actuators.
This is a standard box that I am placing on every room of the house to have a baseline of capabilities:
- temperature and humidity [AM2302]
- light sensor [TSL2561]
- microwave radar movement sensor ([RCWL-0516]) ([here is a review])

# Pre-requisites
You have an instance of Home Assistance with ESPHome ready. There is plenty of tutorial about this on the internet.

# Hardware
## list of components used
- 1 x [Wemos D1 mini]
- 1 x [AM2302]
- 1 x [TSL2561]
- 1 x [RCWL-0516]
- 1 x [plastic container]

## I put it together like this:
![garage_toolbox_1](/assets/media/garage_toolbox_1.jpg)

## And fit it into a plastic container
![garage_toolbox_2](/assets/media/garage_toolbox_2.jpg)
![garage_toolbox_3](/assets/media/garage_toolbox_3.jpg)

# Software
## microcontrolled side
- create a new ESPHome device, I called this one garage_toolbox.
- Edit the esphome garage_toolbox.yaml file so it looks like this:
{% highlight yaml %}
substitutions:
  upper_devicename: Garage Toolbox

esphome:
  name: garage_toolbox
  platform: ESP8266
  board: d1_mini

wifi:
  ssid: "REPLACE_ME"
  password: "REPLACE_ME"
  domain: ".your_local_domain"
  fast_connect: true

# sync the time from Home Assistant  
time:
  - platform: homeassistant
    id: homeassistant_time

# Enable logging
logger:

web_server:
  port: 80

# Enable Home Assistant API
api:
  password: "REPLACE_ME"

ota:
  password: "REPLACE_ME"

# show status using the built in LED
status_led:
  pin:
    number: GPIO2
    inverted: True

# https://esphome.io/components/i2c.html#i2c
# you need to enable i2c before using any devices
i2c:
  sda: 14 # D5
  scl: 12 # D6
  scan: True

sensor:
  - platform: wifi_signal
    name: "${upper_devicename} WiFi signal"
    update_interval: 60s
    accuracy_decimals: 0

  - platform: uptime
    name: "${upper_devicename} uptime"
    accuracy_decimals: 0
    
  # https://esphome.io/components/sensor/tsl2561.html
  - platform: tsl2561
    name: "${upper_devicename} Ambient Light"
    address: 0x39
    update_interval: 60s
    accuracy_decimals: 0
  
  # https://esphome.io/components/sensor/dht.html
  - platform: dht
    pin: D7
    model: AM2302
    temperature:
      name: "${upper_devicename} Temperature"
      accuracy_decimals: 0
    humidity:
      name: "${upper_devicename} Humidity"
      accuracy_decimals: 0
    update_interval: 60s
    
binary_sensor:
  # rcwl-0516
  - platform: gpio
    pin: D1
    name: "${upper_devicename} Motion sensor"
    device_class: motion
{% endhighlight %}
- Compile, download the binary and flash ESPHome (again, there is plenty of tutorials about this out there)

After flashing the ESPhome image the micontroller will restart and connect to the wifi.

## home assistant configuration
- the autodiscovery should take care of finding the new ESPHome device, go to Integrations and you should be able to add it from there.

[Wemos D1 mini]: https://www.aliexpress.com/item/32845061455.html
[RCWL-0516]: https://www.aliexpress.com/item/RCWL-0516-microwave-radar-sensor-module-Human-body-induction-switch-module-Intelligent-sensor/32704946341.html
[TSL2561]: https://www.ebay.com/itm/TSL2561-Luminosity-Sensor-Breakout-infrared-Light-Sensor-Integrating-Sensor/264220584042
[AM2302]: https://www.aliexpress.com/item/5PCS-10PCS-lot-DHT22-AM2302-digital-temperature-and-humidity-sensor-Temperature-and-humidity-module-replace-SHT11/32896608843.html
[here is a review]: https://www.youtube.com/watch?v=IJoPkKlxFXA
[plastic container]: https://www.target.com/p/rectangular-plastic-food-storage-container-made-by-design-153/-/A-53678064
