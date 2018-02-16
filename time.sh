#!/bin/bash


UPTIME=$(uptime)
TASKS=$( ps aux | awk '{print $2}' | wc -l)
USER=$(who | wc -l)
AVERAGE=$(cat /proc/loadavg)
RUNNING=$(ps ao 'pid,user,stat' | grep 'R' | awk '{print $8}' |wc -l)
SLEEPING=$(ps ao 'stat' | grep 'S' | awk '{print $8}' | wc -l)
ZOMBIE=$(ps ao 'pid,stat' | grep 'Z' | wc -l)


MEMORYTOTAL=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
MEMORYFREE=$(cat /proc/meminfo | grep  MemFree | awk '{print $2}')
MEMORYUSED=$(cat /proc/meminfo | grep MemUsed |  awk '{print $2}')
MEMORY1=$(cat /proc/meminfo | grep SwapTotal | awk '{print $2}')
MEMORY2=$(cat /proc/meminfo | grep Swapfree | awk '{print $2}')
MEMORY3=$(free | egrep Mem | awk '{print $6}')
MEMORY4=$(free | awk '{print $3}' | tail -l)
MEMORY5=$(free | egrep Mem | awk '{print $7}')


echo "top -$UPTIME, $USER $LOAD"\n
echo "Tasks: $TASKS total, $RUNNING running, $SLEEPING sleeping, $STOPPED stopped, $ZOMBIE zombie" \n

free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}' 






