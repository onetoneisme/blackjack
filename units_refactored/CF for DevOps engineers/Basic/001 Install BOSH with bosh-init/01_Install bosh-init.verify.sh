#!/bin/bash -e

check 'bosh-init -v' 'version 0.0.81.*' true #> bosh-init not installed or version outdated.
check 'ruby --version' 'ruby 2.*' true #> ruby not installed or version outdated.
