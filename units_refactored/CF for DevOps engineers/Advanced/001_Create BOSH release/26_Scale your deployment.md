###  Scale your deployment

In your `~/deployment/greeter-release.yml` manifest:

1. Add `10.0.0.103` ip from the private static pool to `jobs[name=router][networks=private].static_ips`
2. Increase instances number by 1 in `jobs[name=router].instances`
3. Append `10.0.0.103:8080` to `jobs[name=router].properties.upstreams` array

Deploy once again

```
$ bosh -d ~/deployment/greeter-release.yml deploy
```

And if you curl router multiple times, you should see greetings from different upstreams

```
$ source ~/deployment/vars
$ curl "http://${eip_router}:8080"
```
