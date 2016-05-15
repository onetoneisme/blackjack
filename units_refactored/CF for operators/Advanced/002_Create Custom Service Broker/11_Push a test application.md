## Push a test application

1. Download a test application.

```
$ go get github.com/altoros/pg-app
$ cd $GOPATH/src/github.com/altoros/pg-app
```

2. Push it to the Cloud Foundry.

```
$ cf push pg-app --no-start -m 128M -k 256M
```

3. Create a service

```
$ cf create-service postgresql basic pgsql
```

4. Bind the application to the service.

```
$ cf bind-service pg-app pgsql
```

5. Set the broker name environment variable

```
$ cf set-env postgresql PG_BROKER_NAME
```

6. Start the application

```
cf start pg-app
```

7. Verify the installation. You should see the `SELECT version()` query result:

```
curl -v $(cf app pg-app | grep urls: | awk '{print $2}')
```
