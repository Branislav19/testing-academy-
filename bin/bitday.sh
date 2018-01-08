#!/bin/bash

HOUR=$(date +%k)
PN=12

if [[ $HOUR -ge 0 ]] && [[ $HOUR -lt 2 ]]; then
PN=11


elif [[ $HOUR -ge 2 ]] && [[ $HOUR -lt 4 ]]; then
PN=12


elif [[ $HOUR -ge 4  ]] && [[ $HOUR -lt 6 ]]; then
PN=1

elif [[ $HOUR -ge 6 ]] && [[ $HOUR -lt 8 ]]; then
PN=2

elif [[ $HOUR -ge 8 ]] && [[ $HOUR -lt 10 ]]; then
PN=3


elif [[ $HOUR -ge 10 ]] && [[ $HOUR -lt 12 ]]; then
PN=4


elif [[ $HOUR -ge 12 ]] && [[ $HOUR -lt 14 ]]; then
PN=5


elif [[ $HOUR -ge 14 ]] && [[ $HOUR -lt 16 ]]; then
PN=6

elif [[ $HOUR -ge 16 ]] && [[ $HOUR -lt 18 ]]; then
PN=7


elif [[ $HOUR -ge 18 ]] && [[ $HOUR -lt 20 ]]; then
PN=8


elif [[ $HOUR -ge 20 ]] && [[ $HOUR -lt 22 ]]; then
PN=9

elif [[ $HOUR -ge 22  ]] && [[ $HOUR -lt 00 ]]; then
PN=10


fi


echo "/home/Apollo-13/Pictures/bitday$PN.png"

gsettings set org.gnome.desktop.background \
    picture-uri "file:///home/Apollo-13/Pictures/bitday$PN.png"




   










