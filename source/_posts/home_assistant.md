---
title: Home Assistant usefull tricks
date: 2024-09-22 11:46:15
tags: programming
---

## Connecting to wifi through cli

Connect monitor and keyboard
at the ha> prompt, enter: login
(literally type in the word login, this will get you to a # prompt)
To assure wifi is functioning, enter: nmcli radio
Scan available wifi access enter: nmcli device wifi rescan
List available wifi access enter: nmcli device wifi
Connect to your wifi (incude quotes) enter: nmcli device wifi connect “YOUR_SSID” password “YOUR_WIFI_PASSWORD”
This will try to connect to your SSID and will generate a network profile for you if successfull.
The output will be similar to
"Device 'wlan0' successfully activated with...."
Show connections enter: nmcli con show
There may be two separate ip addresses on your network: one for ethernet, one for wifi.
Check the ip addresses enter: ip addr show
Now connect to http(s)://your_wifi_ip:8123 in your browser.
