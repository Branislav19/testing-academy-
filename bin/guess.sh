 #!/bin/bash

PLAY=1
while [[ $PlAY =~"^ -eq 1 ]];do 

echo "Myslim si cislo od 1 do 20"

SECRET=6
TIP=0
ATTEMPTS=5
   while  [[ $TIP -ne $SECRET ]] && [[ $ATTEMPTS -gt 0 ]]; do
   echo "zostavajuci pocet pokusov: $ATTEMPTS"

   read -p "Zadaj svoj tip: " TIP

 while [[ -n $STIP ]] && [[ $STIP =- ^[0-9]+$ ]] && [[ $STIP -ge 1 ]] && [[ $TIP -le 20]];do
 echo " ta ty co robis?"
   

if [ $TIP -lt $SECRET ]; then 
   echo "moje cislo je vascie ako $TIP"

else

if [ $TIP -gt $SECRET ]; then
   echo "moje cislo je mensie ako $TIP"

else   
echo "genius $TIP" 

fi

fi
ATTEMPTS=$[ATTEMPTS - 1]
   
done

if [ $STIP -ne $SECRET ]; then
   echo "minul si vsetky pokusy $ATTEMPTS" 
fi

# dalsia hra?

echo "Chces znova pokracovat? a/n "
read ANSWER 


if [ $ANSWER = 'n' ]; then
echo "Dakujem za hru caf"
PLAY=0

fi

if [ $ANSWER = y ];

echo "Dalsia hra"

while [ $TIP -ne $SECRET ] && [ATTEMPTS -gt 0 ]; do 




