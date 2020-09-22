---
layout: post
title: Smart garage door controller
published: true
fullview: false
description: esphome powered smart garage door
tags:
- esp8266
- esphome
---
# The problem with regular garage door controllers
Dumb garage doors are annoying. You cant query remotely if they are open or closed, you cant command it to open or close after you left the house, or setup alarms or automations.

This is my implementation of an smart garage door controller.

# 1 - The hardware

## 1.1 - The bill of materials
Get one of each
* microcontroller, I used a [Wemos D1 mini]
* 5v relay
* 2n2222 transistor
* 1kohm resistor
* 220ohm resistor
* 1N4148 diode
* LED diode
* micro switch to sense the door
* a prototyping board

[Wemos D1 mini]: https://www.aliexpress.com/item/32845061455.html

## 1.2 - The circuit
![1](/assets/media/garage-door/schematic.png)

## 1.3 - Put it together
![2](/assets/media/garage-door/1.jpg)
![3](/assets/media/garage-door/2.jpg)


# 2 - The software
## 2.1 - Prepare the custom firmware
I used [ESPHome](https://esphome.io) to create a custom firmware image.

## garage_door.yaml
{% highlight yaml %}
substitutions:
  devicename: garage_door
  friendly_name: Garage Door
  deviceplatform: ESP8266
  deviceboard: d1_mini

esphome:
  name: $devicename
  platform: ESP8266
  board: $deviceboard

wifi:
  ssid: "YOUR WIFI SSID"
  password: "YOUR WIFI PASSWORD"
  domain: ".iot.local"
  fast_connect: true

time:
  - platform: homeassistant
    id: homeassistant_time

# Enable logging
logger:

web_server:
  port: 80

# Enable Home Assistant API
api:
  password: "REPLACE ME"

ota:
  password: "REPLACE ME"

# show status using the built in LED
status_led:
  pin:
    number: D4
    inverted: True

sensor:
  - platform: wifi_signal
    name: "${friendly_name} WiFi signal"
    update_interval: 60s
    accuracy_decimals: 0

  - platform: uptime
    name: "${friendly_name} uptime"
    accuracy_decimals: 0

binary_sensor:
  - platform: gpio
    id: garage_door
    internal: true
    pin:
      number: D7
      mode: INPUT_PULLUP
      inverted: False
    name: "${friendly_name} Sensor"
    device_class: garage_door
    filters:
      - delayed_on: 20ms
 
switch:
  - platform: gpio
    id: relay
    pin:
      number: D1
      inverted: False
    restore_mode: ALWAYS_OFF

cover:
  - platform: template
    name: ${friendly_name}
    device_class: garage
    lambda: |-
      if (id(garage_door).state) {
        return COVER_OPEN;
      } else {
        return COVER_CLOSED;
      }
    open_action:
      # Cancel any previous action
      - switch.turn_off: relay
      - delay: 0.1s
      # Turn the OPEN switch on briefly
      - switch.turn_on: relay
      - delay: 0.1s
      - switch.turn_off: relay
    close_action:
      - switch.turn_off: relay
      - delay: 0.1s
      - switch.turn_on: relay
      - delay: 0.1s
      - switch.turn_off: relay
    stop_action:
      - switch.turn_off: relay
      - delay: 0.1s
      - switch.turn_on: relay
      - delay: 0.1s
      - switch.turn_off: relay
    optimistic: false
    assumed_state: false
{% endhighlight %}

## 2.2 - compile and download the binary

# 3 - Flash it
3.1 - Connect GPIO0 to ground and plug the usb adapter, after a couple seconds disconnect the GPIO0 from the ground. The esp8266 is now in flashing mode.

3.2 - Flash

3.3 - Restart the microcontroller and check that is connecting to the wifi.

3.4 - Add to Home Assistant, if you dont know what that is [you have to watch this!](https://www.youtube.com/watch?v=pVxoSXeC2Jw)

[how to flash anything with an esp8266, even if you dont know the pinout]: https://www.youtube.com/watch?v=BHzsWwd351I
