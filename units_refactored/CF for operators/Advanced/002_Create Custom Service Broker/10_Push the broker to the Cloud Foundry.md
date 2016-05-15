## Push the broker to the Cloud Foundry

1. Push code to the Cloud Foundry but without starting the application

```
$ cf push p-postgresql --no-start -m 128M -k 256M
```

2. Set application's environment. `{GUID}` will be replaced with runtime values.

```
$ AUTH_USER=admin
$ AUTH_PASSWORD=admin
$ PG_SOURCE=$pg_url
$ PG_SERVICES='[{
  "id": "service-1-{GUID}",
  "name": "p-postgresql",
  "description": "DBaaS",
  "bindable": true,
  "plan_updateable": false,
  "plans": [{
    "id": "plan-1-{GUID}",
    "name": "basic",
    "description": "Shared plan"
  }]
}]'

$ cf set-env p-postgresql PG_SOURCE "$PG_SOURCE"
$ cf set-env p-postgresql PG_SERVICES "$PG_SERVICES"
$ cf set-env p-postgresql AUTH_USER "$AUTH_USER"
$ cf set-env p-postgresql AUTH_PASSWORD "$AUTH_PASSWORD"
```

3. Start the application

```
$ cf start p-postgresql
```

4. Register it as a service broker

```
$ BROKER_URL=$(cf app p-postgresql | grep urls: | awk '{print $2}')
$ cf create-service-broker p-postgresql $AUTH_USER $AUTH_PASSWORD http://$BROKER_URL
$ cf enable-service-access p-postgresql
```

5. Check installation in marketplace. `p-postgresql` should be there

```
$ cf marketplace
```
