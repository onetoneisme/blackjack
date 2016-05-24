## Install application dependencies

1. Download and install go packages.
  ```
  go get -u github.com/altoros/pg-puppeteer-go
  go get -u github.com/pivotal-cf/brokerapi
  go get -u github.com/pivotal-golang/lager
  ```

1. Add them into `import` block in `main.go`. It should look like:
  ```go
  import (
    "encoding/json"
    "errors"
    "net/http"
    "os"
    "strings"

    "github.com/altoros/pg-puppeteer-go"
    "github.com/pivotal-cf/brokerapi"
    "github.com/pivotal-golang/lager"
  )
  ```
