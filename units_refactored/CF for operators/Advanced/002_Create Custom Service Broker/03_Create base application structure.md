## Create base application structure

1. Create application directory
  ```
  mkdir -p $GOPATH/src/github.com/$USER/cf-postgresql-broker
  cd $GOPATH/src/github.com/$USER/cf-postgresql-broker
  ```

1. Create the `Procfile` file with the following content:
  ```
  web: cf-postgresql-broker
  ```

1. Create the `manifest.yml` file with the following content:
  ```

  ---
  env:
    GOPACKAGENAME: cf-postgresql-broker
  ```

1. Create the `main.go` file which is going to be the source file for our application
  ```
  package main

  import (
    "encoding/json"
    "errors"
    "net/http"
    "os"
    "strings"
  )
  ```
