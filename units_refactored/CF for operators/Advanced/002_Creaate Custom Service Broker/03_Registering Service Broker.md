## Registering a service broker

Register your Service Broker by running:

```
cf create-service-broker myservice admin admin http://{{cf app myservice-broker | grep urls | awk '{print $2}'}}
cf enable-service-access myservice
```
