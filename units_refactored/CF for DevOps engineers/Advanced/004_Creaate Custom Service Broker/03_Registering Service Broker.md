## Registering Service Broker

Register Service Broker

```
cf create-service-broker myservice admin PASSWORD http://{{cf app myservice-broker | grep urls | awk '{print $2}'}}
cf enable-service-access myservice
```
