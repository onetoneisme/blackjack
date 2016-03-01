#!/bin/bash -e
RESULT=$(curl -s -H "Content-Type: application/json" -X POST -d '{"type":"CD","title":"Adele","description":"Hello"}' http://workshop-12f-stock.$CF_DOMAIN/stock)
COMMAND1=$(curl -s "http://workshop-12f-stock.$CF_DOMAIN/stock/${RESULT}")
COMMAND2='{"id":?*,"type":"CD","title":"Adele","description":"Hello"}'
if [[ $COMMAND1 == $COMMAND2 ]]; then true; else echo "no match";echo "COMMAND1:${COMMAND1}";echo "COMMAND2:${COMMAND2}"; fi

