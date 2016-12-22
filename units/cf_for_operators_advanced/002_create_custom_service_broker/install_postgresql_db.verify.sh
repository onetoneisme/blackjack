#!/bin/bash -e

check 'sudo netstat -tulpn' 'postgres' true #> Postgresql is not installed.
check 'sudo netstat -tulpn' '0.0.0.0:5432' true #> Postgresql is not configured to listen to all IP addresses.
