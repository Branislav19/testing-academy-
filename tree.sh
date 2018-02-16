#!/usr/bin/env bash

#for file in "$dir/"*
#do
#  [[ -d "$file" ]] && echo "$file is a directory"
#  [[ -f "$file" ]] && echo "$file is a regular file"
#done


#for file in tree -d /*; do
 # echo $(basename "$file")
#done

print_dir() {
declare NAME=$1
declare LEVEL=$2
cd "$NAME"

for FILE in *;do
if [[ -d "$FILE" ]]; then
   echo "$LEVEL$FILE/"
   print_dir "$FILE" "$LEVEL "
   else
   echo " $LEVEL$FILE"
   fi
   done

   }

   print_dir .""
