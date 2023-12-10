1. Clean install of bookworm. Start with XPAH adapters unplugged
2. Update/upgrade
3. sudo apt install linux-headers-rpi-v8 #this ensures kernel headers are installed
4. Install TD-XPAH drivers per https://teledatics.com/docs/drivers/
5. Plug in TD-XPAH adapters
6. nmcli dev should now show wlan1 device
