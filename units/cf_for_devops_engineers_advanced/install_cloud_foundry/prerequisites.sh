#!/bin/bash -e

source .profile
check 'bosh -v' 'Current version is .*' true #> BOSH target should be set.
