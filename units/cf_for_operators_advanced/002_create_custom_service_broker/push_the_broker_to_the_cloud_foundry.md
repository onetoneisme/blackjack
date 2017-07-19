## Push the broker to the Cloud Foundry

1. Push code to the Cloud Foundry but without starting the application
  ```exec
  cd ~/go/src/github.com/vcap/cf-postgresql-broker
  cf push postgresql --no-start -m 128M -k 256M -b 'https://github.com/cloudfoundry/go-buildpack#v1.7.16'
  ```

1. Set application's environment. `{GUID}` will be replaced with runtime values.
  ```exec
  source ~/deployment/vars

  cf set-env postgresql PG_SOURCE "$pg_url"
  cf set-env postgresql AUTH_USER "admin"
  cf set-env postgresql AUTH_PASSWORD "admin"
  ```

1. Start the application
  ```exec
  cf start postgresql
  ```

1. Register it as a service broker
  ```exec
  BROKER_URL=$(cf app postgresql | grep urls: | awk '{print $2}')
  cf create-service-broker postgresql admin admin http://$BROKER_URL
  cf enable-service-access postgresql
  ```

1. Check installation in marketplace. `postgresql` should be there
  ```exec
  cf marketplace
  ```
