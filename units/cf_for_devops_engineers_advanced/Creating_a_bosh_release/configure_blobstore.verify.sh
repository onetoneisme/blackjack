#!/bin/bash -e

check 'cat ~/greeter-release/config/final.yml' 'local' #> blobstore is not confiured corectly
