#!/bin/bash -e

check 'curl -I --silent http://api.$CF_DOMAIN/v2/info -H "Host: api.$CF_DOMAIN" | grep --color=never HTTP' 'HTTP/1\.1 200 OK' true #> Cf api should be avaliable.
check 'cf --version' 'cf version 6\..*' true #> Cloud Foundry CLI not installed or version outdated.
check 'git --version' 'git version.*' true #> git is not installed.
check 'cf orgs' 'my-org' true #> Organization 'my-org' wasn't found
check 'cf spaces' 'my-first-space' true #> Space 'my-first-space' wasn't found.
