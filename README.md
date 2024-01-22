Notes:
Requires full desktop version of latest 64 bit raspbian to work. unknown why lite version doesnt work. I'm using a set of 4 gb pi4

-Install drivers per teledatics documentation at https://teledatics.com/docs/drivers/
-Install bridge-utils package "apt-get install bridge-utils" 

1. Create dhcp server for bridge. the file etho.network should be placed in etc/systemd/network  
2. Full_mesh.sh contents should be saved on pi. adjust mesh name, interface names and IP address to fit your wishes
3. Run full_mesh.sh (will need to run "sudo chmod +x full_mesh.sh" first to make the script executable)
4. Plug EUD into pi via ethernet port.

At this point you should be able to connect your EUD to the pi via ethernet connection and ping from eud to other nodes on your mesh (i used termux app and "ping" command)
I am accomplishing this with a USB-C to Ethernet adapter https://www.amazon.com/gp/product/B09Q5XC7T9/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&th=1

todo: more testing to confirm I can repeat this, then range testing, then consolidate the mesh/bridge script and sort out how to get it to run automatically on start up. Then pretty
up this page, get BoM. also need to get a basic 3d print case put together for field work
