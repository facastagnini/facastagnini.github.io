---
layout: post
title: A different gift for my friend
published: false
tags:
- raspberrypi
- electronics
fullview: false
description: When you see something really cool on the internet and you wish you had that idea...
---

# A different gift for my friend
This is sort of a fan post, because when I saw [Reynico's present for his friend] I thought "Man, that it was so cool", that I would have to make a different gift for my friend Diego.
Diego is a fan of Mr. Robot, and this is his birthday present.

TODO add a demo gif/video

# Build yours

## You will need
- a Raspberry Pi ( I used a zero w)
- one micro SD card
- a bunch of other stuff...

## The hardware
TODO add schematics, etc

## The software

- Install Raspbian Lite on the micro SD card. This is beyond the scope of this document, you can find a good guide [here].
- Enable sshd ([guide here]).
- Update the os and rename the node
{% highlight bash %}
# update the os
pi@raspbian:~ $ sudo apt update && sudo apt -y full-upgrade
# Rename the os
pi@raspbian:~ $ sudo sed -i 's/raspberrypi/mrrobot/' /etc/hosts /etc/hostname
# reboot to apply the changes
pi@mrrobot:~ $ sudo reboot
{% endhighlight %}
- Install homebridge
{% highlight bash %}
# sudo apt install git make libavahi-compat-libdnssd-dev
pi@mrrobot:~ $ sudo apt install git make libavahi-compat-libdnssd-dev
pi@mrrobot:~ $ wget -q -O - https://nodejs.org/dist/v9.10.1/node-v9.10.1-linux-armv6l.tar.gz | tar -zxvf -
pi@mrrobot:~ $ sudo mv node-v9.10.1-linux-armv6l /opt/node
pi@mrrobot:~ $ sudo update-alternatives --install "/usr/bin/node" "node" "/opt/node/bin/node" 1
pi@mrrobot:~ $ sudo update-alternatives --install "/usr/bin/npm" "npm" "/opt/node/bin/npm" 1
pi@mrrobot:~ $ sudo npm install --unsafe-perm -g homebridge
pi@mrrobot:~ $ sudo ln -sf /opt/node/lib/node_modules/homebridge/bin/homebridge /usr/local/bin/homebridge


# Install some plugins
pi@mrrobot:~ $ sudo npm install -g homebridge-pi
pi@mrrobot:~ $ sudo pm install -g homebridge-better-http-rgb
pi@mrrobot:~ $ sudo npm install -g homebridge-script2

# create a user for the service
pi@mrrobot:~ $ sudo useradd -M --system homebridge
pi@mrrobot:~ $ sudo adduser homebridge gpio
pi@mrrobot:~ $ sudo mkdir -p /var/lib/homebridge
pi@mrrobot:~ $ sudo chown homebridge:homebridge /var/lib/homebridge

# If you dont have one, create the config file.
pi@mrrobot:~ $ sudo wget -q -O /var/lib/homebridge/config.json https://raw.githubusercontent.com/nfarina/homebridge/master/config-sample.json

# install init script Running Homebridge on Bootup (systemd) https://gist.github.com/johannrichard/0ad0de1feb6adb9eb61a/
pi@mrrobot:~ $ sudo wget -O /etc/default/homebridge https://gist.githubusercontent.com/johannrichard/0ad0de1feb6adb9eb61a/raw/1cf926e63e553c7cbfacf9970042c5ac876fadfa/homebridge
pi@mrrobot:~ $ sudo wget -O /etc/systemd/system/homebridge.service https://gist.githubusercontent.com/johannrichard/0ad0de1feb6adb9eb61a/raw/1cf926e63e553c7cbfacf9970042c5ac876fadfa/homebridge.service

# start the service
pi@mrrobot:~ $ sudo systemctl daemon-reload
pi@mrrobot:~ $ sudo systemctl enable homebridge
pi@mrrobot:~ $ sudo systemctl start homebridge

# You can check the status of the service by calling
pi@mrrobot:~ $ systemctl status homebridge
{% endhighlight %}

- install python3 and RPi.GPIO
{% highlight bash %}
pi@mrrobot:~ $ sudo apt install python3 python3-pip
pi@mrrobot:~ $ sudo pip3 install RPi.GPIO
{% endhighlight %}


[Reynico's present for his friend] http://blog.reyni.co/2018/01/20/a-different-birthday-present-for-my-friend/
[here] https://www.raspberrypi.org/downloads/raspbian/
[guide here] https://www.raspberrypi.org/documentation/remote-access/ssh/
[1] https://github.com/nfarina/homebridge/wiki/Running-Homebridge-on-a-Raspberry-Pi
[3] https://github.com/nfarina/homebridge
