#!/bin/bash -e

check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/vendor/vendor.json' 'pg-puppeteer-go' true #> Dependencies are not stored in vendor folder.
