#!/bin/bash -e

source .profile
check 'bosh stemcells' 'ubuntu' true #> ubuntu stemcell not found on director
