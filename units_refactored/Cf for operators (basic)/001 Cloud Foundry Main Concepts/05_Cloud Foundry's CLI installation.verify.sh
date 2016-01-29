#!/bin/bash -e

check 'cf --version' 'cf version 6\.1.*' #> Cloud Foundry CLI not installed or version outdated.
