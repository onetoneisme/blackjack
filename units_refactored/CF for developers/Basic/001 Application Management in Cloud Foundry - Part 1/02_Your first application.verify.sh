#!/bin/bash -e

check 'cf target | grep --color=never "API endpoint"' '.*.*API version.*.*' true #> Cloud Foundry is not set or is set incorrectly.
check 'cf target | grep --color=never "User"' '^$' false #> You are not logged in.
check 'cf target | grep --color=never "Org"' '^$' false #> Org is not selected.
check 'cf target | grep --color=never "Space"' '^$' false #> Space is not selected.
