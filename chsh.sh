#!/bin/bash


echo "change shell for $USER"
read -p "New Shell [/bin/bash]: $SHELL" 


if [[  $# -eq 0 ]]; then
exit 0
fi



if [[  $SHELL -eq 1 ]]; then   
echo "chsh.sh: Shell must be a full path name" 1>&1
exit  1
fi


if [[ -e $SHELL ]]; then
echo "chsh.sh: \"$SHELL\" does not exist" 1>&1
exit 1
fi



if [[ -x  $SHELL  ]]; then
echo "chsh.sh: \"$SHELL\" is not executable" 1>&1
exit 1
fi




