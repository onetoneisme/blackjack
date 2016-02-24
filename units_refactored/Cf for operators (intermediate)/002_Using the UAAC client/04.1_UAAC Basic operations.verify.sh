#!/bin/bash -e

check 'uaac target' 'Target: https://uaa.' true #> UAAC has no target or target invalid
check 'uaac target' 'Context:' true #> UAAC token invalid or not set
