## Push the broker to the Cloud Foundry

1. Push code to the Cloud Foundry but without starting the application
  ```
  cf push postgresql --no-start -m 128M -k 256M -b 'https://github.com/cloudfoundry/go-buildpack#v1.7.8'
  ```

1. Set application's environment. `{GUID}` will be replaced with runtime values.
  ```
  AUTH_USER=admin
  AUTH_PASSWORD=admin
  PG_SOURCE=$pg_url
  PG_SERVICES='[{
    "id": "service-1-{GUID}",
    "name": "postgresql",
    "description": "DBaaS",
    "bindable": true,
    "plan_updateable": false,
    "plans": [{
      "id": "plan-1-{GUID}",
      "name": "basic",
      "description": "Shared plan"
    }]
  }]'

  cf set-env postgresql PG_SOURCE "$PG_SOURCE"
  cf set-env postgresql PG_SERVICES "$PG_SERVICES"
  cf set-env postgresql AUTH_USER "$AUTH_USER"
  cf set-env postgresql AUTH_PASSWORD "$AUTH_PASSWORD"
  ```

1. Start the application
  ```
  cf start postgresql
  ```

1. Register it as a service broker
  ```
  BROKER_URL=$(cf app postgresql | grep urls: | awk '{print $2}')
  cf create-service-broker postgresql $AUTH_USER $AUTH_PASSWORD http://$BROKER_URL
  cf enable-service-access postgresql
  ```

1. Check installation in marketplace. `postgresql` should be there
  ```
  cf marketplace
  ```
