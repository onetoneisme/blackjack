## Binding a service to an app

1. Create a Service:

	```
	cf create-service myservice shared my-service-instance
	```

2. Bind the Service to the test app:

	```
	cf bind-service test-app my-service-instance
	```

3. Restage the app:

	```
	cf restage test-app
	```

