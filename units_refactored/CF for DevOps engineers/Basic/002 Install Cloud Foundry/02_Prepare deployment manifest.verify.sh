#!/bin/bash -e

check 'cat ~/deployment/minimal-aws.yml | grep REPLACE' '^$' true #> all required fields in manifest should be replaced  
