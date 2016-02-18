#!/bin/bash -e

CF_DOMAIN=54.164.224.55.xip.io

echo Running commands for unit: 001 Cloud Foundry Main Concepts

curl -o cf_cli.deb -J -L 'https://cli.run.pivotal.io/stable?release=debian64&source=github'
sudo dpkg -i cf_cli.deb
check 'cf --version' 'cf version 6\.1.*' true #> Cloud Foundry CLI not installed or version outdated.