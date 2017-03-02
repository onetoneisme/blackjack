#!/bin/bash -e

check 'cat ~/deployment/bosh.yml' 'name' true #> name section not found in the manifest.
check 'cat ~/deployment/bosh.yml' 'releases' true #> releases section not found in the manifest.
check 'cat ~/deployment/bosh.yml' 'jobs' true #> jobs section not found in the manifest.
check 'cat ~/deployment/bosh.yml' 'templates' true #> templates section not found in the manifest.
check 'cat ~/deployment/bosh.yml' 'networks' true #> networks section not found in the manifest.
check 'cat ~/deployment/bosh.yml' 'properties' true #> properties section not found in the manifest.
check 'cat ~/deployment/bosh.yml' 'cloud_provider' true #> cloud_provider section not found in the manifest.
