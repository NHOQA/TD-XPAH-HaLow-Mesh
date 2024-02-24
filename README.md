2/18/24: Uploaded a Pi image with all the stuff below already done. Should work, just will need to edit your device specific stuff in fullmesh.sh, fullmesh.service, and eth0.network. Plus probably the host and username. Let me know if this does not work. Should be about 8GB<br> https://drive.google.com/file/d/1w98dIYALfXgsfjkuJJJLbZ1mVNOHPKv9/view?usp=sharing <br>
Or if you want to step through everything, continue below <br>

Notes:
Requires full desktop version of latest 64 bit raspbian to work. unknown why lite version doesnt work. The Pi's used are all 4gb Pi 4. HaLow units are Teledatics TD-XPAH V1.5

  - since this image includes a desktop, for the first boot ill go into raspi-config and set to boot directly to console<br> 
    since we'll never use the desktop again <br>
  - Install drivers per teledatics documentation at https://teledatics.com/docs/drivers/  <br>
  - Teledatics image with driver pre-installed https://teledatics.com//image/Teledatics_Raspbian_Bullseye_64bit_8GB_Mesh_20204-Jan-10.zip <br>
  - Install bridge-utils package "apt-get install bridge-utils" 

Once those pre-requisites are done, set up Pi as follows

1. Create dhcp server for bridge. the file eth0.network should be placed in etc/systemd/network  
2. fullmesh.sh contents should be saved on Pi. Adjust mesh name, interface names and IP address to fit your wishes. if you do adjust the script name, make sure to adjust it in fullmesh.service also
3. Place fullmesh.service in /etc/systemd/system , adjust as needed
4. Confirm permissions with "sudo chmod 744 ~/fullmesh.sh" and "sudo chmod 644 /etc/systemd/system/fullmesh.service"
5. Restart systemd "sudo systemctl daemon-reload"
6. Enable service "sudo systemctl enable fullmesh.service"
7. Reboot pi, wait 30 seconds for systemd service to run script. can check status w/ "sudo systemctl status fullmesh.service". Note since the script disables network manager, you'll no longer be able to SSH into your pi. To edit anything after this point I just plug a keyboard and monitor directly into the pi
8. Plug EUD into pi via ethernet port.

At this point you should be able to connect your EUD to the pi via ethernet connection and ping from EUD to other nodes on your mesh (we used termux app and "ping" command)
The physical connection to the pi is done with a USB-C to Ethernet adapter https://www.amazon.com/gp/product/B09Q5XC7T9/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&th=1 <br>

Range <br>
![Screenshot_20240202-182151~2](https://github.com/NHOQA/TD-XPAH_Mesh/assets/74009174/6343a2c4-ce3f-4fde-83df-91218b7835b7) <br>
Range between 2 nodes, one carried by me, another sitting on top of my house ~20' up probably, through decently dense single family homes. Two notes <br>
- There was a single pretty heavy packet drop (20+packets) at the first yellow marker (~190m) once that recovered, no more noticable drops until max range
- Max range comes on suddenly. not many packet drops or extended ping times before just cutting out completely. and that distance is pretty repeatable, i could go back and forth across it pretty repeatably with the second yellow marker at ~220m where connection would get problematic and the red marker at 225m being a pretty hard cutoff every time.

  Previous range testing seems to show ~100m between individual nodes when both are carried at ground level through the same terrain.
  LoS reception for ground based nodes is at least 500m, I had a cutout there on only long LoS test, but 50/50 was terrain issue.  Not bad for 21 dbm

Notes as of 2/2/24 <br>
- For this current version, do not plug in EUD until after Pi has booted. I usually wait a minute or so before plugging in. Seems to be some kind of issue with the EUD picking up an IP quickly if it start plugged in. <br>
- Have transmitted voice between nodes, need to sort out best way to get that integrated, currently just using a dedicated PTT app in play store.
- Still need to get a decent BOM built

Notes 2/10/24 <br>
- found I was still running the nodes on channel 153 ,that was 2 MHz bandwidth. Hurts range as I understand it as power is spread across more of the spectrum. Script here is CH. 36 which corresponds to 908.5 MHz with a 1 MHz bandwidth. rolling that to my nodes. originally thought ch 153 would allow more TX power.
- Also, including a meshtastic node in this package. Currently meshtastic hardware is running on a private channel on medium/fast settings. need to sort out the frequencies its actually transmitting on so it does not overlap 908.5 and interfere with the HaLow transmission.
- HaLow 908.5 MHz, Meshtastic ch 33 med/fast per https://meshtastic.org/docs/overview/radio-settings/ is 910.125 MHz. if we go to channel 104 freq. will be 927.875  how much spread will it have from this frequency?

Notes 2/11/24 <br>
- with TD-XPAH set to ch 36 and Meshtastic at ch 104, there is zero overlap. 
![HaLow ch36](https://github.com/NHOQA/TD-XPAH_Mesh/assets/74009174/08f8a75d-4671-4bcf-bb47-c94b73ed0cbf)
![meshtastic ch104](https://github.com/NHOQA/TD-XPAH_Mesh/assets/74009174/711b8379-153c-4b33-99b0-b4ae861c3fd0)

2/24/24 Range testing notes <br>
Worked in a slightly less dense neighborhood compared to home. Cliff notes:
-Mild obstructions (houses trees) , managed to catch a ping out to around 400m, Full obstruction of signal cut down to about 200 meters. at the 200m range signal can be stopped by putting a house in between nodes.

green markers are first missed packet. yellow markers are pauses in moving to re-establish connection. red is lost connection

It was noted that when losing ping connection, i could stop walking for a few seconds and connection would re-establish. noted by yellow markers.
base node at around 6' AGL, travel node at about 4' AGL (im just carrying it). HaLow still seems pretty LoS dependent.

Light obstruction, 400m <br>
![Screenshot_20240224-124855](https://github.com/NHOQA/TD-XPAH-HaLow-Mesh/assets/74009174/e2f14036-b4b0-448e-82e8-43b2962929ce)

Heavy obstruction, just under 200m <br>
![Screenshot_20240224-124811](https://github.com/NHOQA/TD-XPAH-HaLow-Mesh/assets/74009174/3148cf8d-9441-40a9-997d-d6133721c3cd)

light-ish obstruction, ran out of road after 300m, still getting pings <br>
![Screenshot_20240224-124659](https://github.com/NHOQA/TD-XPAH-HaLow-Mesh/assets/74009174/92db2247-d8b1-4bc1-9b6c-482c1e155829)

putting this house in between nodes killed signal as soon as it broke Los <br>
![Screenshot_20240224-124943](https://github.com/NHOQA/TD-XPAH-HaLow-Mesh/assets/74009174/f94cf895-ff61-49e2-88dd-1445aaaefae9)

