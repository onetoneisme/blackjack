#!/bin/bash -e

source .profile
check 'bosh deployments' 'greeter' #> greeter sdeployment not found on director
source ~/deployment/vars
check 'curl --silent "http://$eip_greeter:8080"' 'Greetings from' #> response from greeter app is incorrect
