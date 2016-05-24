## Push a test application

1. Download and install a test application.
  ```
  go get -u github.com/altoros/pg-app
  go get -u github.com/kardianos/govendor
  cd $GOPATH/src/github.com/altoros/pg-app
  govendor sync
  ```

1. Push it to the Cloud Foundry.
  ```
  cf push pg-app --no-start -m 128M -k 256M -b 'https://github.com/cloudfoundry/go-buildpack#v1.7.8'
  ```

1. Create a service
  ```
  cf create-service postgresql basic pgsql
  ```

1. Bind the application to the service.
  ```
  cf bind-service pg-app pgsql
  ```

1. Set the broker name environment variable
  ```
  cf set-env pg-app PG_BROKER_NAME postgresql
  ```

1. Start the application
  ```
  cf start pg-app
  ```

1. Verify the installation. You should see the `SELECT version()` query result:
  ```
  curl -v $(cf app pg-app | grep urls: | awk '{print $2}')
  ```
