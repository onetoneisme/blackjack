## Binding Service to the App

1. Create Service

```
cf create-service myservice shared my-service-instance
```

2. Bind Service

```
cf bind-service test-app my-service-instance
```

3. Resatage the app

```
cf restage test-app
```

