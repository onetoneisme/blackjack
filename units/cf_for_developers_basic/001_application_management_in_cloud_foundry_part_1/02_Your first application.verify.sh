#!/bin/bash -e

check 'cf target | grep --color=never "API endpoint"' '.*.*API version.*.*' true #> Cloud Foundry is not set or is set incorrectly.
check 'cf target | grep --color=never "User"' '^$' false #> You are not logged in with the correct user.
check 'cf target | grep --color=never "Org"' '^$' false #> The org is not selected or is incorrect.
check 'cf target | grep --color=never "Space"' '^$' false #> The space is not selected or is incorrect.
