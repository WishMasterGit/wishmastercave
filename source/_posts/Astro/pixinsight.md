---
title: Pixinsight tricks
date: 08-25-2025
tags: astro
---

## Basic DeepSky Algorythm

1. start with Script > Batch Processing > Weightedbakchprocessing
2. Open result folder from NINA and select autocropped images
3. Select output folder
4. Start Batch processing it might take a while, if it is new installation of pixinsight you might need to install NVIDIA
support
5. After the processing open _drizzle_autocrop files
6. Rename files to match filters, just makes it easier later
7. Appy dynamic crop to all files, this makes it easier to extract background later
8. Add Images to image container, makes it easier to batch process
9. Use grxpert for background extraction, select all images in container and run script
10. Apply BlurXTerminator to all images in container
11. Use channel combination to create RGB image
12. use image solver to plate solve the image
13. Apply spectrophotometric color calibration, don't forget to select right filers settings
14. Use statistical stretch to stretch the image, both rgb and light
15. remove stars from the RGB and light with StarX
16. Combine light and rgb with LRGBcombination
17. Use curves to adjust the gradients
18. Add stars back with PixelMath plugin: apply formula ~((~rgb)*(~stars))
