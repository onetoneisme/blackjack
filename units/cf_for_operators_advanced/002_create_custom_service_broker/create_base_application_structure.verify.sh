#!/bin/bash -e

check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/Procfile' 'web' true #> Procfile is not created.
check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/manifest.yml' 'env' true #> Procfile is not created.
