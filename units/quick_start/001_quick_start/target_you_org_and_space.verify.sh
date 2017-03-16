#!/bin/bash -e

check 'cf target' $CF_ORG true #> Org not targeted correctly.
check 'cf target' $CF_SPACE true #> Space not targeted correctly.
