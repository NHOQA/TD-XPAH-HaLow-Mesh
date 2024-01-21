Notes:
Requires full desktop version of latest 64 bit raspbian to work. unknown why lite version doesnt work. I'm using a set of 4 gb pi4

Install drivers per teledatics documentation at https://teledatics.com/docs/drivers/
Install bridge-utils package "apt-get install bridge-utils" 

1. Create dhcp server for bridge. the file "good xpah dchp" should be placed in etc/systemd/network  mine is named eth0.network
2. Full_mesh.txt contents should be saved as .sh file on pi. adjust mesh name, interface names and IP address to fit your wishes
3. Run full_mesh.sh (or whatever .sh file name you gave to full_mesh.txt contents)

At this point you should be able to connect your EUD to the pi via ethernet connection and ping from eud to other nodes on your mesh
I am accomplishing this with a USB-C to Ethernet adapter https://www.amazon.com/gp/product/B09Q5XC7T9/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&th=1

todo: more testing to confirm I can repeat this, then range testing, then consolidate the mesh/bridge script and sort out how to get it to run automatically on start up. THen pretty
up this page, get BoM. also need to get a basic 3d print case put together for field work
