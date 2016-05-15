## Implement the main function

The **main** function is required by any go application. Have a look at code comments.

```
func main() {
	// Set up logger
	logger := lager.NewLogger(appName(os.Getenv("VCAP_APPLICATION"), "cf-postgresql-broker"))
	logger.RegisterSink(lager.NewWriterSink(os.Stdout, lager.DEBUG))

	// Set up authentication
	credentials := brokerapi.BrokerCredentials{
		Username: os.Getenv("AUTH_USER"),
		Password: os.Getenv("AUTH_PASSWORD"),
	}

	// Create requests handler
	handler, err := newHandler(
		os.Getenv("PG_SOURCE"),
		os.Getenv("PG_SERVICES"),
		os.Getenv("CF_INSTANCE_GUID"))

	if err != nil {
		logger.Fatal("handler", err)
	}

	// Register requests handler
	http.Handle("/", brokerapi.New(handler, logger, credentials))

	// Boot up
	port := os.Getenv("PORT")

	if port == "" {
		port = "8080"
	}

	logger.Info("boot-up", lager.Data{"port": port})

	if err := http.ListenAndServe(":"+port, nil); err != nil {
		logger.Fatal("listen-and-serve", err)
	}
}
```
