#!/bin/bash -e

source .profile
check 'bosh target' 'Current target is 2.*' true #> BOSH target should be set.
