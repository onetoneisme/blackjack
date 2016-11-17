#!/bin/bash -e

check 'curl -I --silent http://api.$CF_DOMAIN/v2/info -H "Host: api.$CF_DOMAIN" | grep --color=never HTTP' 'HTTP/1\.1 200 OK' true #> CF API must be avaliable. 
