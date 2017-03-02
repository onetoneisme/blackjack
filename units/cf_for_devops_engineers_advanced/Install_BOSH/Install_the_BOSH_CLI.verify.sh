#!/bin/bash -e

check 'bosh -v' 'version' true #> bosh not installed.
