#!/bin/bash -e

check 'cf target | grep --color=never "Org"' 'training' true #> Org not targeted correctly.
check 'cf target | grep --color=never "Space"' 'test-space' true #> Space not targeted correctly.
