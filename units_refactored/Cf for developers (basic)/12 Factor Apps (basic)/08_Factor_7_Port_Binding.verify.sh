#!/bin/bash -e
FACTOR7_RESPONSE=$(curl -s http://workshop-12f-stock.$CF_DOMAIN/stock/factor7)
PATTERN='?*'
PATTERN1='IP?*Ports?*'
if [[ $FACTOR7_RESPONSE == $PATTERN1 ]]; then true; else echo "Please add /factor7 endpoint"; fi