#!/bin/bash -e

check 'cf target | grep --color=never "API endpoint"' '.*.*API version.*.*' true #> Cloud Foundry is not set or is set incorrectly.
check 'cf target | grep --color=never "User"' 'User:           my-user' true #> You are not logged in with the correct user.
check 'cf target | grep --color=never "Org"' 'Org:            my-org' true #> The org is not selected or is incorrect.
check 'cf target | grep --color=never "Space"' 'Space:          my-space' true #> The space is not selected or is incorrect.
