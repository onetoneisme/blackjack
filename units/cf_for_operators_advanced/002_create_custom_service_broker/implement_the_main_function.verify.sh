#!/bin/bash -e

check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/main.go' 'func main' true #> main function is not added.
