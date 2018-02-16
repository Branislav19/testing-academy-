#!/usr/bin/env bash



#ID=$(cat ~/ml-latest-small/movies.csv | egrep -o "^[0-9]+,") #poradie-cislo filmu
#TITLE=$(cat ~ml-latest-small/movies.csv | egrep "^[0-9]+,.+\([0-9]{4}\)") #nazov filmu
#YEAR=$(cat ~ml-latest-small/movies.csv | egrep "[0-9]{4}\)") # rok vyroby filmu
#GENRE=$(cat ~/ml-latest-small/movies.csv |  egrep "^[0-9]+,.+\([0-9]Action|Comedy|Drama|Horror|Thriller|Adventure|Sci-Fi|Children|Fantasy|Animation|Romance|Mystery|Crime|War|Western|Documentary|Musical|Film-Noir+$") #zaner filmu


fileinput=~/ml-latest-small/movies.csv
while read -r LINE; do
LINE1=$(echo $LINE | egrep -o "^[0-9]+," | tr -d ",")
LINE2=$(echo $LINE | egrep -o ",.+ ")
LINE3=$(echo $LINE | egrep -o "[0-9]{4}")
LINE4=$(echo $LINE | egrep -o "^[0-9]+,.+\([0-9]*Action|Comedy|Drama|Horror|Thriller|Adventure|Sci-Fi|Children|Fantasy|Animation|Romance|Mystery|Crime|War|Western|Documentary|Musical|Film-Noir+$") 



echo -e " {
\"id\" : \"$LINE1\",
\"title\" : \"$LINE2\",
\"year\" : \"$LINE3\",
\"genres\" : \"[$LINE4]\"

}"
        

done < $fileinput


