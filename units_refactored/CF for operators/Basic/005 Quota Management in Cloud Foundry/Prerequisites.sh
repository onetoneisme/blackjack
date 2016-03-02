#!/bin/bash -e

check 'curl -I --silent http://api.$CF_DOMAIN/v2/info -H "Host: api.$CF_DOMAIN" | grep --color=never HTTP' 'HTTP/1\.1 200 OK' true #> Cf api should be avaliable.
check 'cf --version' 'cf version 6\.1.*' true #> Cloud Foundry CLI not installed or version outdated.
check 'cf orgs' 'my-org' true #> Organization 'my-org' wasn't found
check 'cf spaces' 'my-first-space' true #> Space 'my-first-space' wasn't found.
check 'cf org-users my-org' 'ORG AUDITOR.*my-user' true #>User "my-user" not found or not assigned as ORG AUDITOR.
check 'cf space-users my-org my-first-space' 'SPACE DEVELOPER.*my-user' true #>User "my-user" not found or not assigned as SPACE DEVELOPER
