---
title: Pixinsight tricks
date: 08-25-2025
tags: astro
---

## Basic DeepSky Process

1. start with Script>Weightedbatchprocessing
2. Open result folder and select autocropped images

PixelMath plugin:
apply formula ~((~rgb)*(~stars))
