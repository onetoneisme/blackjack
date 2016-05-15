## Install application dependencies

1. Download and install go packages

```
$ go get github.com/altoros/pg-puppeteer-go
$ go get github.com/pivotal-cf/brokerapi
$ go get github.com/pivotal-golang/lager
```

2. Add them into `import` block in `main.go`. It should look like:

```
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
