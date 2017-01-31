#!/bin/bash -e

source ~/.profile
source ~/.profile && check 'uaac target' 'Target: https://uaa.' true #> UAAC has no target or target invalid
source ~/.profile && check 'uaac target' 'Context:' true #> UAAC token invalid or not set
