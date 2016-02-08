rpi-buildroot Meuh! Player
==========================

## Synopsis

This project is based on rpi-buildroot (https://github.com/gamaral/rpi-buildroot)

## How to build

Simply follow instructions in https://github.com/gamaral/rpi-buildroot,
but use the *raspberrypi_meuh_defconfig* instead of the default one.

## Motivation

The aim is to demonstrate the power of buildroot to quickly build
a Web radio player, that boots fast (the radio starts to play in less than 20 seconds)
It can work headless, but also displays the radio logo when a hdmi screen is connected. 

This is a proof of concept, but as it must be fun,
the target radio example is the famous http://www.radiomeuh.com

![alt tag](http://www.radiomeuh.com/wp-content/themes/meuh/images/logo.svg)


## What's next

Next steps will be to add lcd touch screen support, to 
change the radio station and control the output volume.

Beside that, another project is to use RPI/Buildroot as a Bluetooth backend,
for playing sound from a bluetooth source onto an amplifier. Coming soon !
