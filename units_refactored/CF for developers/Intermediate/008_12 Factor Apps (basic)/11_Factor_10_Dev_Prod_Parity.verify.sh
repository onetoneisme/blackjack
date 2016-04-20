#!/bin/bash -e
check 'curl -s http://workshop-12f-stock-production_test.$CF_DOMAIN/stock/ping' 'Ping null' true #> Please create production_test space and push your application.