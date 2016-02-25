#!/bin/bash -e

source .profile
source deployment/vars
check 'bosh target' 'Current target is .* ' true #> BOSH target should be set.  
