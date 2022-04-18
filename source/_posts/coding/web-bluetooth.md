---
title: Web Bluetooth 
date: 2022-04-17 14:00:00
tags: programming
---

## State of the API

[Web Bluetooth API specification](https://webbluetoothcg.github.io/web-bluetooth/) is not finalized yet, the spec authors are actively looking for enthusiastic developers to try out this API and give [feedback on the spec](https://github.com/WebBluetoothCG/web-bluetooth/issues) and [https://bugs.chromium.org/p/chromium/issues/entry?components=Blink%3EBluetooth](feedback on the implementation.)

Bluetooth references:
[Bluetooth specifications](https://www.bluetooth.com/specifications/specs/)
[Bluetooth company identifiers](https://www.bluetooth.com/specifications/assigned-numbers/company-identifiers/)

## Parcel https cheat-sheet
install mkcert (brew or choco) than

```bash
$mkcert -install
$mkcert localhost 
```

after that you can use it in parcel for example:

```bash
$parcel --https src/index.html --cert certificate.cert --key private.key
```
