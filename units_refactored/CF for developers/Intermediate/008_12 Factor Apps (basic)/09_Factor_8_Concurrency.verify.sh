#!/bin/bash -e
#check '$RESPONSE2' '2/2' true 
RESPONSE2=$(cf apps | grep --color=never workshop-12f-stock | awk '{print $3}')
if [[ $RESPONSE2 == '2/2' ]]; then true; else echo "Please make sure that both instances of your application are up"; fi