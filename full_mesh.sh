#!/bin/bash
#this is the mesh and bridge scripts combined. successfully tested individually
#seems to require full 64 bit desktop version of raspbian, "lite" does not work, unknown why
#before running script, you will need
#1. DHCP config file installed (in file list of this github)
#2. bridge-utils installed
#3. TD_XPAH drivers installed per https://teledatics.com/docs/drivers/

#stop some processes that interfere with what we're trying to do
systemctl stop wpa_supplicant
systemctl stop NetworkManager

#set variables these will need to be adjusted to match your system/desired mesh settings
INTERFACE=wlan1 #this is the XPAH interface. need to have drivers for it installed before running this
MESH_NAME=natak_mesh #adjust to whatever you want, all nodes need exact same name
ETH=eth0 #ethernet interface, adjust to match your ethernet interface name
IP_ADDR=192.168.200.3/24 #adjust to whatever you want, unique address for each node. with this format vary
# x, 192.168.200.x/24

ifconfig $INTERFACE down
sysctl -w net.ipv4.ip_forward=1
sysctl -p
iw reg set "US"
iw dev $INTERFACE set type managed
iw dev $INTERFACE set 4addr on
iw dev $INTERFACE set type mesh
iw dev $INTERFACE set meshid $MESH_NAME
#iw dev $INTERFACE set channel 36 #original channel setting from teledatics 908.5 MHZ w/ 1 MHz bandwidth
iw dev $INTERFACE set channel 153 # using this instead of 36 to allow full 30 dbm tx power
ip addr add $IP_ADDR dev $INTERFACE
ifconfig $INTERFACE up
echo 'Mesh Created'
echo 'Waiting 5 Seconds'
sleep 5
# this section of the script is to create bridge add eth0 and wlan1 to that bridge, "br0" in this case

#create bridge
sudo brctl addbr br0 #will need to have bridge-utils installed
echo 'Bridge Created'
#assign IP to bridge, in this case the ip of the mesh node
sudo ip address add $IP_ADDR dev br0

#bring bridge up
sudo ip link set dev br0 up

#add eth ethernet port to bridge
sudo brctl addif br0 $ETH # eth0

#add mesh connection to bridge
sudo brctl addif br0 $INTERFACE # wlan1

#delete ip from mesh node to avoid conflict
sudo ip address del $IP_ADDR dev $INTERFACE
echo 'Bridge Online'
