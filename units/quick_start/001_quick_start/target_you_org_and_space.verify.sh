#!/bin/bash -e

check 'cf target | grep --color=never "Org"' $CF_ORG true #> Org not targeted correctly.
check 'cf target | grep --color=never "Space"' $CF_SPACE true #> Space not targeted correctly.
