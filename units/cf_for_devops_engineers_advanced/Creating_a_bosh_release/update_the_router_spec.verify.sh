#!/bin/bash -e

check 'cat ~/greeter-release/jobs/router/spec' 'upstreams' #> router spec is not filled correctly
