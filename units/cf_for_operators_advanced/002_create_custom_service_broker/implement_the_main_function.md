## Implement the main function

The **main** function is a starting point for any go application. Have a look at code comments.

```file=~/go/src/github.com/$USER/cf-postgresql-broker/main.go
//This is a struct, that is responsible for handling all reauests to the broker
type Handler struct {
  //DB operations orchestrator
  Db *pgp.PGPuppeteer
}

func main() {
	// Set up authentication
	credentials := brokerapi.BrokerCredentials{
		Username: os.Getenv("AUTH_USER"),
		Password: os.Getenv("AUTH_PASSWORD"),
	}

	//create database connection
	conn, err := pgp.New(os.Getenv("PG_SOURCE"))
	if err != nil {
		panic(err)
	}

	// Set up logger
	logger := lager.NewLogger("cf-postgresql-broker")
	logger.RegisterSink(lager.NewWriterSink(os.Stdout, lager.DEBUG))

	// Register requests handler
	http.Handle("/", brokerapi.New(&Handler{Db: conn}, logger, credentials))

	// Boot up
	port := os.Getenv("PORT")
	if err := http.ListenAndServe(":"+port, nil); err != nil {
		panic(err)
	}
}
```
