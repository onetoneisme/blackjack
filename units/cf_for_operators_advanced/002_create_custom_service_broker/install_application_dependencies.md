## Install application dependencies

1. Download and install go packages.
  ```exec
  go get -u github.com/altoros/pg-puppeteer-go
  go get -u github.com/pivotal-cf/brokerapi
  go get -v github.com/cloudfoundry/lager
  mkdir $GOPATH/src/code.cloudfoundry.org/
  cp -R $GOPATH/src/github.com/cloudfoundry/lager/ $GOPATH/src/code.cloudfoundry.org/
  ```

1. Create the `main.go` file which is going to be the source file for our application:
  ```file=~/go/src/github.com/$USER/cf-postgresql-broker/main.go
  package main

  import (
    "context"
    "encoding/json"
    "errors"
    "net/http"
    "os"

    "github.com/altoros/pg-puppeteer-go"
    "github.com/pivotal-cf/brokerapi"
    "code.cloudfoundry.org/lager"
  )
  ```
