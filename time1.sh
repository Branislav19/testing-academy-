#!/bin/bash

UPTIME=$(uptime)
SYSTEMLOAD=$(cat /proc/loadavg)
USERS=$(who | wc -l)
IPADDRESS=$(ip -4 route get 8.8.8.8 | awk {'print $7'} | tr -d '\n')
PROCESSES=$(ps aux | wc -l) 


echo "$UPTIME $SYSTEMLOAD $USAGE $IPADDRESS $PROCESSES"
  



