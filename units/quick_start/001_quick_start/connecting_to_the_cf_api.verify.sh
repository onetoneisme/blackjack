#!/bin/bash -e

check 'cf target | grep --color=never "API endpoint"' '.*API version.*' true #> Cloud Foundry is not set or is set incorrectly.
check 'cf target | grep --color=never "Not logged in"' 'Not logged in' false #> You are not logged in with correct user.
