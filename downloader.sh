#!/usr/bin/env bash

# testing,ze to ma prave dva parametre
if [[ ! $# -eq 2 ]]; then
   echo "Wrong usage." 1>&2
   exit 1

fi   



LIST=${1}
NAME=${2}
# testni, ci subor existuje
if [[ ! -f ${LIST} ]]; then
   echo "File ${LIST} doesnt't exist." 1>&2
   exit 1

fi
DEST=/home/Apollo-13/Pictures/${NAME}
mkdir ${DEST}
NR=1

printf "Working "
while read -r LINK; do
printf "."
wget -q ${LINK} -O ${DEST}/${NR}.jpg
NR=$((NR+1))
done < /home/Apollo-13/bin/comix.links.txt
echo

zip -q ${NAME}.cbz ${DEST}/*

rm -rf ${DEST}
echo "Done"




