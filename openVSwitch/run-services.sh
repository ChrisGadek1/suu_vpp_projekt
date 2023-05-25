#!/bin/bash


#Collect required ovs soft
sudo apt-get install openvswitch-switch

#Create new ovs network
sudo ovs-vsctl add-br ovs-br1

#Build services images
docker build -t receiver -f node_arm/receiver/Dockerfile node_arm/receiver
docker build -t sender -f node_arm/sender/Dockerfile node_arm/sender

#Create containers based on images builded in previous step and run the,
docker run -itd --name receiver receiver
docker run -itd --name sender sender

#Connect containers to ovs network
sudo ovs-docker add-port ovs-br1 eth1 receiver
sudo ovs-docker add-port ovs-br1 eth1 sender

#Show ovs network status
sudo ovs-vsctl show

#Show docker status
docker ps -a
