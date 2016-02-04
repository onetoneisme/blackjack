#!/bin/bash -e

cmd=$1
eval cmd_res=\`${cmd}\`
regex=$2
match=$3
regex_ok=false
if [[ $cmd_res =~ $regex ]] ; then
 regex_ok=true
fi
if  (! $regex_ok && $match) || ($regex_ok && ! $match) ; then
 echo "Cmd output: $cmd_res"
fi
