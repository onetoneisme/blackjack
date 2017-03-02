#!/bin/bash -e

check 'cat ~/greeter-release/jobs/router/templates/config.yml.erb' 'upstreams' #> router config is not filled correctly
