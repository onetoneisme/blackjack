### Deploy!

Finally, everything is ready for deployment:

```exec
bosh deployment ~/deployment/greeter.yml

bosh deploy
```

Let's check if everything has been deployed as intended:
```exec
curl "http://{{source ~/deployment/vars && echo $eip_greeter}}:8080"
```

To list all your VMs, execute this command:
```exec
bosh vms
```
