---
layout: post
title: Why I am syncing my files with SyncThing
published: true
fullview: false
description: So I have a desktop computer and a laptop, and I want to be able to switch from one to another...
---
# The scenario

So I have two Apple computers, a desktop and a laptop, and I want to be able to jump from one to another, whenever I fell like switching. The total file size that I am trying to keep synchronized at the moment is about 1TB. 

Clearly I need some sort of continue bi-directional file synchronization mechanism to keep my files homogeneous on both devices.

Even more, I would like to share some folders with friends and grant read-only or read-write access.

# Starting point

The solution must:
- Protect my privacy. Grant me absolute control over my data.
- Provide multiplatform support (Mac and Linux at least)
- Be flexible and scale with my needs (sync more than 1TB, sync n folders with n devices, etc)
- [KISS](https://en.wikipedia.org/wiki/KISS_principle)
- Fit in my budget, be affordable.

# Solutions

## Rsync, Unison, scp, other cmd line tools

This tools are awesome, they are solid and well tested because they have been around for a long time. I think they are great for sysadmins, static scenarios and specific tasks, but they fall short for the kind of workstation sync that I want to do.

## [Google Drive](https://support.google.com/drive/answer/2375123?hl=en)/[Dropbox](https://www.dropbox.com/plans)/etc

### Pros
- Extremely simple to setup and use.
- Inexpensive if you have to store up to 100GB (or even 1TB)
- There is a copy in the cloud, you can access your file from anywhere.

### Cons
- Gets expensive if you need more storage.
- Does not scale well: There is limitations in the maximum storage size.
- Fail to give you privacy and full control over your data. They don't provide client side encryption, so a third party who (legally or illegally) can put their hands over your data can read it.
- Closed source. 

I want privacy and full control of my data. I didn't feel like continue researching cloud providers, so I switched entirely to peer-to-peer alternatives. 

## [BitTorrent Sync](https://www.resilio.com/)

### Pros
- Peer-to-Peer
- Lightning fast
- Protects your privacy and grants you full control over your data with client side encryption.
- Your data only sync to your approved devices, there is no cloud storage.
- There is no limit in the amount of storage or devices to sync.
- Touches the internet with 3 services. Their are there to simplify the peer discovery and the sync over the internet (behind routers, etc). They can be disable to be absolutely private.
- Pricing? It is free.

### Cons
- No way to start BitTorrent Sync as a daemon in Mac, because it required the X windows system to be running, it can only be configure as an Agent, forcing me to be logged in to start to sync. This is a mayor drawback for me, I want the sync to be running as soon the machine is powered up (For security reasons autologin is not an option).
- You have no control over the peers, once they have the key, they have access to the data.
- Closed source

## [SyncThing](http://syncthing.net/)

### Pros
- Peer-to-Peer
- Protects your privacy and grants you full control over your data with client side encryption.
- Your data only sync to your approved devices, there is no cloud storage.
- There is no limit in the amount of storage or devices to sync.
- Touches the internet with the external peer discovery service. It is there there to allow the peer discovery and the sync over the internet. Can be disable to be absolutely private.
- Is a daemon. It starts before login any user (does not require the X window system)
- The control panel is a web interface, so is consistent across platforms.
- Open source (if there is something broken [you can fix it](https://github.com/syncthing/syncthing/pull/1232))
- Pricing? It is free.

### Cons
- I haven't found cons yet. I love this tool!

# Conclusion

There is no "best" sync tool. There is multiple scenarios, and some tools may be more appropriated than others. Don't settle down until you find the one that suits your needs. Keep testing, find that tool.
