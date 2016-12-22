#!/bin/bash -e

check 'go version' 'go1.7' true #> Go version 1.7 is not installed.
source ~/.profile
check 'govendor -version 2>&1 || exit 0' '1.*' true #> govendor is not installed.
