#!/bin/bash -e

source .profile # This is required to read the new shell configuration for RVM.
check 'bosh --version' 'BOSH 1.*' true #> BOSH CLI not installed or version outdated.
