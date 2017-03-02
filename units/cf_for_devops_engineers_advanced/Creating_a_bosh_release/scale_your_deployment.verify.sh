#!/bin/bash -e

source .profile
check 'bosh vms | grep app | wc -l ' '2' #> There should be 2 vms for job app
