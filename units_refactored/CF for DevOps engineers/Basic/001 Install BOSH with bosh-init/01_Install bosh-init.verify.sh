#!/bin/bash -e

check 'bosh-init -v' '0.0.90' true #> bosh-init not installed or version outdated.
check 'ruby --version' '2.3.*' true #> ruby not installed or version outdated.
