#!/bin/bash -e

check 'curl -I --silent http://api.$CF_DOMAIN/v2/info -H "Host: api.$CF_DOMAIN" | grep --color=never HTTP' 'HTTP/1\.1 200 OK' true #> Cf api should be avaliable.
check 'cf --version' 'cf version 6\.1.*' true #> Cloud Foundry CLI not installed or version outdated.
check 'git --version' 'git version.*' true #> git is not installed.
check 'cf apps' 'my-app.*started' true #> "my-app" application not found or not running.
check 'cf services' 'my-app-db' true #> Service 'my-app-db' wasn't found.
