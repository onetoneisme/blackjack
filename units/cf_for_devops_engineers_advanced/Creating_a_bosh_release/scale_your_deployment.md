###  Scale your deployment

In your `~/deployment/greeter.yml` manifest:

1. Add the `10.0.0.9` IP to the private static pool `/networks/name=private/subnets/gateway=10.0.0.1/static/-`
1. Add the `10.0.0.9` IP from the private static pool to `/jobs/name=app/networks/name=private/static_ips/-`
1. Increase the number of instances in `/jobs/name=app/instances` by 1
1. Append `10.0.0.9:8080` to the `/jobs/name=router/properties/upstreams/-` array


The best way to do this is to create an opfile. We are leaving the creation of such file at the discretion of a user. Another option is to update the manifest manually.
Note, that while identifying properties path we use the same syntax, as used in opfiles, so that these properties can be copied without any modifications.

Deploy once again:

```exec
bosh  deployment ~/deployment/greeter.yml

bosh deploy
```

And if you `curl` the router multiple times, you should see greetings from different upstreams:

```exec
curl "http://{{source ~/deployment/vars && echo $eip_greeter}}:8080"
```



