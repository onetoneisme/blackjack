#!/bin/bash -e

check 'cat ~/greeter-release/jobs/router/monit' 'router' #> router monit is not filled correctly
