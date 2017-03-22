#!/bin/bash -e

check 'cat ~/greeter-release/jobs/app/monit' 'app' #> app monit is not filled correctly
