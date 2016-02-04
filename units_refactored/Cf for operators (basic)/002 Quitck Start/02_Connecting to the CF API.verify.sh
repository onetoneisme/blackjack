#!/bin/bash -e

check 'cf target | grep --color=never "API endpoint"' '.*http://api.127.0.0.1.xip.io.*' true #> Cloud Foundry is not set or is set incorrectly.
check 'cf target | grep --color=never "User"' 'User:           admin' true #> You are not logged in with correct user.
