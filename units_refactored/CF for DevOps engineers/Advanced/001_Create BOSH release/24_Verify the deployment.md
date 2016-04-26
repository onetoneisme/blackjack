### Verify the deployment

```
curl "http://{{source ~/deployment/vars && echo $eip_router}}:8080"
```

To see the list of your vms execute the following command:
```
bosh vms
```
