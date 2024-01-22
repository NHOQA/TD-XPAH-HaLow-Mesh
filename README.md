Notes:
Requires full desktop version of latest 64 bit raspbian to work. unknown why lite version doesnt work. I'm using a set of 4 gb pi4

  -Install drivers per teledatics documentation at https://teledatics.com/docs/drivers/  <br>
  -Install bridge-utils package "apt-get install bridge-utils" 

Once those pre-requisites are done, set up Pi as follows

1. Create dhcp server for bridge. the file eth0.network should be placed in etc/systemd/network  
2. Full_mesh.sh contents should be saved on Pi. Adjust mesh name, interface names and IP address to fit your wishes
3. Run full_mesh.sh (will need to run "sudo chmod +x full_mesh.sh" first to make the script executable)
4. Plug EUD into pi via ethernet port.

At this point you should be able to connect your EUD to the pi via ethernet connection and ping from EUD to other nodes on your mesh (we used termux app and "ping" command)
The physical connection to the pi is done with a USB-C to Ethernet adapter https://www.amazon.com/gp/product/B09Q5XC7T9/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&th=1

Todo as of 1/22/24  <br>
-More testing to confirm the script is consistent  <br>
-Range testing, should involve getting a 3d printed case file together to allow easier movement  <br>
-Sort out how to get script to run automatically on start up. <br>
-Look at Tx power. Per Teledatics max Tx power is 21 dbm. NRC7292 docs look to call out 30 dbm, and power meter seems to show 30dbm at antenna. Test how power varies with channel setting. Current channel of 153 seems to allow full 30dbm, but per NRC channel map docs, is 2 MHz bandwidth. For range considerations, would prefer 1 MHz with the 30 dbm Tx power. But the channels (in channel map doc) that will do that are 1-11, which do not seem to be working now.
