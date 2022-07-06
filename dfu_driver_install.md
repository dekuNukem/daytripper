# Installing the STM32 DFU Driver

[Buy on Tindie!](https://www.tindie.com/products/dekuNukem/daytripper-hide-my-windows-laser-tripwire/) | [Official Discord](https://discord.gg/VM4kbnf) | [Getting Started](quick_start_guide.md) | [Main Page](/README.md)

-----

First, make sure you have followed the procedure of **`holding down the DFU button while plugging in the device`**.

Once plugged in, you can release the button. The lights and screen should stay off.

If nothing shows up in `STM32 DfuSe tool`, you probably need to install a driver.

## Driver Install Instructions

**`Right click`** on the start button, then select `Device Manager`:

![Alt text](resources/photos/app/start.png)

Expand the node for USB devices. If you see a device called **`STM32 BOOTLOADER`** (or something similar) WITHOUT yellow triangle:

Double click it, go to `Driver` tab, click `Uninstall Device` button, check the `Delete the driver software` box, then press `Uninstall`.

![Alt text](resources/photos/uninstall.png)

Now you should have a **`STM32 BOOTLOADER`** device with yellow triangle.

**`Double click`** on it, select `Update Driver...`, then select `Browse my computer for driver software`

![Alt text](resources/photos/driver_select.png)

[Click me](https://github.com/dekuNukem/daytripper/raw/master/resources/STM-Bootloader-Driver.zip) to download the driver. Extract everything to a folder.

Press `Browse...`, and select the entire folder.

![Alt text](resources/photos/folder_select.png)

Windows should find and install the driver automatically.

![Alt text](resources/photos/driver_done.png)

After it's done, you can continue the guide as usual. 