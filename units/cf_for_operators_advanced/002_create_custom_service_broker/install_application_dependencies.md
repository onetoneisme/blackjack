## Install application dependencies

1. Download and install go packages.
  ```
  go get -u github.com/altoros/pg-puppeteer-go
  go get -u github.com/pivotal-cf/brokerapi
  go get -u code.cloudfoundry.org/lager
  ```

1. Create the `main.go` file which is going to be the source file for our application:
  ```go
  package main

  import (
    "context"
    "encoding/json"
    "errors"
    "net/http"
    "os"

    "github.com/altoros/pg-puppeteer-go"
    "github.com/pivotal-cf/brokerapi"
  )
  ```
