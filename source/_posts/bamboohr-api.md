---
title: BambooHR API howto
date: 2019-04-03  15:41:00
tags: programming
---

## URL compositions

```url
https://{API Key}:x@api.bamboohr.com/
```

at our case subdomain was arkadiumkrd and just arkadium

Now you need to go to the portal and generate your API key, than you can request company report:

```url
/api/gateway.php/arkadiumkrd/v1/reports/{number}?format=csv
```