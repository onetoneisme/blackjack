###  Scale your deployment

In your `~/deployment/greeter.yml` manifest:

1. Add the `10.0.0.103` IP from the private static pool to `jobs[name=app][networks=private].static_ips`.
2. Increase the number of instances in `jobs[name=app].instances` by 1.
3. Append `10.0.0.103:8080` to the `jobs[name=router].properties.upstreams` array

Deploy once again:

```
bosh -d ~/deployment/greeter.yml deploy
```

And if you `curl` the router multiple times, you should see greetings from different upstreams:

```
curl "http://{{source ~/deployment/vars && echo $eip_router}}:8080"
```
