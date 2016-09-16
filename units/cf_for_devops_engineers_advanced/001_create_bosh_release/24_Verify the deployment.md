### Verify the deployment

Let's check if everything has been deployed as intended:
```
curl "http://{{source ~/deployment/vars && echo $eip_router}}:8080"
```

To list all your VMs, execute this command:
```
bosh vms
```
