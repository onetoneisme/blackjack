## Push a test application

1. Download and install a test application.
  ```exec
  go get -u github.com/altoros/pg-app
  go get -u github.com/kardianos/govendor
  cd $GOPATH/src/github.com/altoros/pg-app
  govendor sync
  ```

1. Push it to the Cloud Foundry.
  ```exec
  cf push pg-app --no-start -m 128M -k 256M -b 'https://github.com/cloudfoundry/go-buildpack#v1.7.16'
  ```

1. Create a service
  ```exec
  cf create-service postgresql basic pgsql
  ```

1. Bind the application to the service.
  ```exec
  cf bind-service pg-app pgsql
  ```

1. Set the broker name environment variable
  ```exec
  cf set-env pg-app PG_BROKER_NAME postgresql
  ```

1. Start the application
  ```exec
  cf start pg-app
  ```

1. Verify the installation. You should see the `SELECT version()` query result:
  ```exec
  curl $(cf app pg-app | grep urls: | awk '{print $2}')
  ```
