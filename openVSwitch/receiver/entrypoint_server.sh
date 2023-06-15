#!/bin/bash

# Get the PAIR_NUM environment variable
PAIR_NUM="${PAIR_NUM:-1}"

INTERFACE="eth0"

# Calculate the IP address based on the PAIR_NUM
IP_ADDRESS="172.17.$((PAIR_NUM + 1)).2"

# Assign the IP address to the eth1 interface
ip addr add "$IP_ADDRESS/16" dev "$INTERFACE"

# Start the iperf server
iperf -s -V
