#!/bin/bash -e

source .profile # This is required because profile is not sources by default for non interactive sessions, and RVM don't work
check 'bosh --version' 'BOSH 1.*' true #> BOSH CLI not installed or version outdated.
