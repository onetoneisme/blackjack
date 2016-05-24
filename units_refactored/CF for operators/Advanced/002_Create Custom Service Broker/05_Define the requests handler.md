## Define the requests handler

1. Let's define base struct for our application. It represents requests handler that will implement required API calls and include DB manipulation package `pgp`. Add the following code to `main.go`
  ```
  type Handler struct {
    *pgp.PGPuppeteer
    services []brokerapi.Service
  }
  ```

1. Also we will need these errors, because our ``
var (
	ErrAsyncNotSupported    = errors.New("async operaions are not supported")
	ErrUpdatingNotSupported = errors.New("updating is not supported")
)
`broker doesn't need all the functionality that the Cloud Foundry provides.
  ```
  var (
    ErrAsyncNotSupported    = errors.New("async operaions are not supported")
    ErrUpdatingNotSupported = errors.New("updating is not supported")
  )
  ```
