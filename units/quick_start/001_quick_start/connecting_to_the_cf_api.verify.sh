#!/bin/bash -e

check 'cf target' '.*API version.*' true #> Cloud Foundry is not set or is set incorrectly.
check 'cf target' 'Not logged in' false #> You are not logged in with correct user.
