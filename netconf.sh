#!/bin/bash

ifconfig enp12s0 147.232.22.130 netmask 255.255.255.224 up
route add default gw 147.232.22.129

echo "nameserver 8.8.8.8 >> ~/etc/resolve.conf"

