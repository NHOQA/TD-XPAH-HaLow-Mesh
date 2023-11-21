# XPAH
TD-XPAH 802.11s w/RPi

Based off the nov 20, 2023 meshAP image uploaded at https://teledatics.com/docs/rpi_image/
To the best of my knowledge this is the current method based off discord chats as off 11/21/23

1. Download image
2. Flash to SD card, current image is ~15 gb I believe, so make sure your card is large enough. I used the Raspberry Pi imager for this. used the custom config to set up my wifi connection and hostname
3. Ensure the TD-XPAH is in host mode per https://teledatics.com/docs/host/
4. Ensure TD-XPAH is NOT plugged into RPi USB port
5. Insert SD card into RPi and boot
6. Once Pi is booted, plug in TD-XPAH to RPi USB port
7. Edit br0 IP address at /etc/systemd/network/16-br0_up.network to ensure each of your bridges have a unique IP (default is 192.168.1.1)
8. Run sudo systemctl remove wpa_supplicant@wlan1.service
9. Run sudo systemctl restart accesspoint@wlan1.service and sudo systemctl restart wpa_supplicant
10. Wait ~1-2 minutes, then attempt a ping between nodes
