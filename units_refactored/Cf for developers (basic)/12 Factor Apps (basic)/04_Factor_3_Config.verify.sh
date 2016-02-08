#!/bin/bash -e

check 'curl -I --silent http://workshop-12f-stock.$CF_DOMAIN/stock/ping -H "Host: workshop-12f-stock.$CF_DOMAIN" | grep --color=never HTTP' 'HTTP/1\.1 200 OK' true #> Please push your Application. 
