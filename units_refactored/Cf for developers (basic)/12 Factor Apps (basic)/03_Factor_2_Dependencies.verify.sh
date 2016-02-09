#!/bin/bash -e
check 'curl -s http://workshop-12f-stock.$CF_DOMAIN/stock/ping' 'Ping' true #> Please push your Application.