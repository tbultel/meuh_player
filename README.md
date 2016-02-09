rpi-buildroot Meuh! Player
==========================

## Synopsis

This project is a Web radio player, based on rpi-buildroot (https://github.com/gamaral/rpi-buildroot)
It uses MPD (Music Player Daemon) and MPC. 
The rasberry starts to play the radio at bootup.

## How to build

Simply follow the build and SD card setup instructions in https://github.com/gamaral/rpi-buildroot,
but use the **raspberrypi_meuh_defconfig** instead of the default one.

## Motivation

The aim is to demonstrate the power of buildroot to quickly build
a light Web radio player, that boots fast (the radio starts to play in less than 20 seconds)
It works headless.

This is a proof of concept, which does not mean that it cannot be fun,
the target radio example is the famous http://www.radiomeuh.com

![alt tag](http://www.radiomeuh.com/wp-content/themes/meuh/images/logo.svg)


## What's next

Next steps will be to add lcd touch screen support, to 
change the radio station and control the output volume.

Beside that, another project is to use RPI/Buildroot as a Bluetooth backend,
for playing sound from a bluetooth source onto an amplifier. Coming soon !
