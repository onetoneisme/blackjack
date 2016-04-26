### Verify the deployment

```
source ~/deployment/vars
curl "http://${eip_router}:8080"
```

To see the list of your vms execute the following command:
```
bosh vms
```
