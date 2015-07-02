---
title: Monitoring RSYSLOG with Zabbix
published: true
tags:
- monitoring
---

RSYSLOG is the rocket-fast system for log processing. (source [rsyslog.com](http://www.rsyslog.com/}))
Zabbix is a enterprise-class monitoring solution. (source [zabbix.com](http://www.zabbix.com/))

Said that, I can tell the story.

Some time ago I wanted to monitor some RSYSLOG internals with Zabbix. Since I couldn't find anything that suit my needs I put something together, and now I am making it public in the hope that someone can find it useful.

The installation is really simple and takes advantage of the Zabbix auto-discovery rules to configure itself and produce nice graphs. I keep the install instructions in a github repository, so please [check it out](https://github.com/facastagnini/zabbix-rsyslog#installation).

![zabbix1](/assets/Monitoring_RSYSLOG_with_Zabbix1.png)
![zabbix2](/assets/Monitoring_RSYSLOG_with_Zabbix2.png)
