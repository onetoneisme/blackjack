#!/bin/bash -e

check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/main.go' 'main' true #> main.go is not created.
