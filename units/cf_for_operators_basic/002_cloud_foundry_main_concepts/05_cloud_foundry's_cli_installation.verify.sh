#!/bin/bash -e

check 'cf --version' 'cf version 6\.*' true #> Cloud Foundry CLI not installed or version outdated.
