#!/bin/bash -e

check 'cat ~/deployment/minimal-aws.yml | grep REPLACE --color=never' '^$' true #> all required fields in manifest should be replaced  
