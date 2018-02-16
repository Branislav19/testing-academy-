#!/usr/bin/env bash


 inputFile=~/ml-latest-small/movies.csv
 OLDIFS=$IFS


 IFS=,
  [ ! -f $inputFile ] && { echo "$inputFile file not found"; exit 99; }

 echo "
  {
   \"checklog\":
   ["

 csvLength=`cat $inputFile | wc -l` csv
 Depth=1

 while read cardid checkstatus checkdate checktime
  do
  echo -e "   {
  \"ID\" : \"$cardid\",
   \"Title and year\" : \"$checkstatus\",
    \"Genres\" : \"$checkdate\"
     }"
   if [ "$csvDepth" -lt "$csvLength" ];
   then
   echo -e " },"
  else
    echo -e " }"
  fi
 csvDepth=$(($csvDepth+1))
 done < $inputFile

 echo "   ]
  }"

IFS=$OLDIFS

