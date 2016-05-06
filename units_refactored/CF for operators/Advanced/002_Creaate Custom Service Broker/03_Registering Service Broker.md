## Registering Service Broker

Register Service Broker

```
cf create-service-broker myservice admin admin http://{{cf app myservice-broker | grep urls | awk '{print $2}'}}
cf enable-service-access myservice
```
