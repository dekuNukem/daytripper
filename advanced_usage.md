# Daytripper Advanced Usage Guide

[Main Page](/README.md) | [Buy Daytripper](https://www.tindie.com/products/dekuNukem/daytripper)

If you're not familiar with Daytripper yet, please see the [Quick Start Guide](/quick_start_guide.md) first.

## Custom Actions

Instead of hiding windows, you can perform custom actions when TX is triggered.

`photo of RX backside`

Slide the Mode Select Switch on RX to `CUSTOM`, middle position. After this, `ALT + PAUSE` will be pressed when TX is triggered. 

This key combo normally doesn't do anything, but you can capture it with a software and then perform your own actions. 

### Windows 

You can use [autohotkey](https://www.autohotkey.com). Here's a [sample configuration file](resources/AutoHotkey.ahk) upon which you can tinker with.

### MacOS

You can write an applescript and then make an App Shortcut:

![Alt text](resources/photos/applescript.png)

Of course there's always [bettertouchtool](https://folivora.ai) as well.

### Linux

Oh I'm sure you'll figure it out 😉

## On-air Packet Format

Daytripper uses a nRF24L01-compatible chip called Si24R1. It is much cheaper, and actually has a higher TX power output, resulting in longer communication range.

Daytripper operates at `channel 115`, `address 0xDA 0xBB 0xED 0xC0 0x0C`.

Data rate is `250kbps`, TX power is `+7dBm`, `Auto Acknowledgment` is used.

Daytripper TX sends 6-byte packets, details below:

![Alt text](resources/photos/packets.png)

* The first byte (byte 0) is a unique identifier calculated from the microcontroller serial number. 

* Second byte (byte 1) denotes what this packet is about. It can be either a test packet, trigger packet, or status update packet.

* The rest 4 bytes are payloads, the meaning depending on the command type. 

* For a `Test` packet, the 4 bytes are the same incrementing sequence number repeated 4 times. 

* For a `Trigger` packet, the first two bytes are the baseline reading of the power-up calibration. And the last two bytes are the actual distance reading. Unit in mm.

* For a `status` packet, the first two bytes are the latest battery voltage reading in mV. The last two bytes are the time-since-power-on count, multiply it by 5 to get the number of seconds elapsed since TX power-on.

* The `vbat_mV` is about 300mV lower than the actual battery voltage, due to the diode drop. 

## Using Multiple Modules

Daytripper wasn't designed with multiple TX/RX boards in mind. And I haven't done any extensive testings.

### Single RX Multiple TX

In this scenario RX will react when ANY of the multiple TX fires.

### Single TX Multiple RX

Here ALL of RX will react when TX fires.

### Multiple TX Multiple RX

Untested, probably a mess.   

## Debug Modes

There is a user button on both TX and RX board. Usually they are unused:

![Alt text](resources/photos/buttons.jpg)

For TX, a short press (less than 2 seconds) recalibrates the baseline. A long press (more than 2 seconds) enters Test Mode, where it sends test packets with incrementing sequence number as payload every second. It can be used to test communication range. Turn it off then on again to exit Test Mode. 

For RX a press on the button types out some debug messages. Make sure you open a text editor first. 

## USB DFU Firmware Updates

The above two buttons also acts controls Device Firmware Update (DFU) through USB. 

how to enter

download the app.

select dfu files, how to create them. 

## tech specs



battery capacity
charge current
pinouts
