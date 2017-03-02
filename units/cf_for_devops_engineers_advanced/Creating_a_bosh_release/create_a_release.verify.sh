#!/bin/bash -e

source .profile
check 'bosh releases' 'greeter-release' #> greeter release is not found on director
