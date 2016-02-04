#!/bin/bash -e

check 'curl -I --silent http://workshop-12f-stock.127.0.0.1.xip.io/stock/ping -H "Host: workshop-12f-stock.127.0.0.1.xip.io" | grep --color=never HTTP' 'HTTP/1\.1 200 OK' true #> Please push your Application. 