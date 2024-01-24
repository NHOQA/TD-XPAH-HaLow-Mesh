Notes:
Requires full desktop version of latest 64 bit raspbian to work. unknown why lite version doesnt work. The Pi's used are all 4gb Pi 4. HaLow units are Teledatics TD-XPAH V1.5

  -Install drivers per teledatics documentation at https://teledatics.com/docs/drivers/  <br>
  -Install bridge-utils package "apt-get install bridge-utils" 

Once those pre-requisites are done, set up Pi as follows

1. Create dhcp server for bridge. the file eth0.network should be placed in etc/systemd/network  
2. Full_mesh.sh contents should be saved on Pi. Adjust mesh name, interface names and IP address to fit your wishes
3. Place fullmesh.service in /etc/systemd/system
4. Confirm permissions with "sudo chmod 744 ~/fullmesh.sh" and "sudo chmod 644 /etc/systemd/system/fullmesh.service"
5. Reboot pi, wait 30 seconds for systemd service to run script. can check status w/ "sudo systemctl status fullmesh.service"
6. Plug EUD into pi via ethernet port.

At this point you should be able to connect your EUD to the pi via ethernet connection and ping from EUD to other nodes on your mesh (we used termux app and "ping" command)
The physical connection to the pi is done with a USB-C to Ethernet adapter https://www.amazon.com/gp/product/B09Q5XC7T9/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&th=1

Todo as of 1/24/24  <br>
-More testing to confirm the script is consistent  <br>
-Range testing, should involve getting a 3d printed case file together to allow easier movement  <br>

