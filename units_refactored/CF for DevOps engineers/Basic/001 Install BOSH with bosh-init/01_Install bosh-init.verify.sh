#!/bin/bash -e

check 'bosh-init -v' 'version 0.0.81.*' true #> bosh-init not installed or version outdated.
source .profile # This is required because profile is not sources by default for non interactive sessions, and RVM don't work
check 'ruby --version' 'ruby 2.*' true #> ruby not installed or version outdated.
