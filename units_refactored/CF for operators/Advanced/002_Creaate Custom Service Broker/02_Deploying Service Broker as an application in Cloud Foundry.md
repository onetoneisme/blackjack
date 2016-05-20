## Deploying a service broker as an application in Cloud Foundry

To deploy a service broker as a Cloud Foundry app, run the following commands:

```
cf push myservice-broker --no-start -m 128M -k 256M
cf set-env myservice-broker CREDENTIALS '{"port": "4000", "host": "1.2.3.4"}'
cf set-env myservice-broker SERVICE_NAME myservice
cf set-env myservice-broker SERVICE_PLAN_NAME shared
cf start myservice-broker
```
