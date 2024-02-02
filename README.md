Notes:
Requires full desktop version of latest 64 bit raspbian to work. unknown why lite version doesnt work. The Pi's used are all 4gb Pi 4. HaLow units are Teledatics TD-XPAH V1.5

  -Install drivers per teledatics documentation at https://teledatics.com/docs/drivers/  <br>
  -Install bridge-utils package "apt-get install bridge-utils" 

Once those pre-requisites are done, set up Pi as follows

1. Create dhcp server for bridge. the file eth0.network should be placed in etc/systemd/network  
2. Full_mesh.sh contents should be saved on Pi. Adjust mesh name, interface names and IP address to fit your wishes
3. Place fullmesh.service in /etc/systemd/system , adjust as needed
4. Confirm permissions with "sudo chmod 744 ~/fullmesh.sh" and "sudo chmod 644 /etc/systemd/system/fullmesh.service"
5. Restart systemd "sudo systemctl daemon-reload"
6. Enable service "sudo systemctl enable fullmesh.service"
7. Reboot pi, wait 30 seconds for systemd service to run script. can check status w/ "sudo systemctl status fullmesh.service"
8. Plug EUD into pi via ethernet port.

At this point you should be able to connect your EUD to the pi via ethernet connection and ping from EUD to other nodes on your mesh (we used termux app and "ping" command)
The physical connection to the pi is done with a USB-C to Ethernet adapter https://www.amazon.com/gp/product/B09Q5XC7T9/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&th=1 <br>

Range <br>
![Screenshot_20240202-182151~2](https://github.com/NHOQA/TD-XPAH_Mesh/assets/74009174/6343a2c4-ce3f-4fde-83df-91218b7835b7) <br>
Range between 2 nodes, one carried by me, another sitting on top of my house ~20' up probably, through decently dense single family homes. Two notes <br>
- There was a single pretty heavy packet drop (20+packets) at the first yellow marker (~190m) once that recovered, no more noticable drops until max range
- Max range comes on suddenly. not many packet drops or extended ping times before just cutting out completely. and that distance is pretty repeatable, i could go back and forth across it pretty repeatably with the second yellow marker at ~220m where connection would get problematic and the red marker at 225m being a pretty hard cutoff every time.

  Previous range testing seems to show ~100m between individual nodes when both are carried at ground level through the same terrain.
  LoS reception is at least 500m, I had a cutout there on only long LoS test, but 50/50 was terrain issue.  Not bad for 21 dbm

Notes as of 2/2/24 <br>
- For this current version, do not plug in EUD until after Pi has booted. I usually wait a minute or so before plugging in. Seems to be some kind of issue with the EUD picking up an IP quickly if it start plugged in. <br>
- Have transmitted voice between nodes, need to sort out best way to get that integrated, currently just using a dedicated PTT app in play store.
- Still need to get a decent BOM built


