#!/bin/bash -e
check 'curl -s http://workshop-12f-stock.$CF_DOMAIN/stock/ping' 'Ping some_value' true #> Please set proper environment variable and push your application.