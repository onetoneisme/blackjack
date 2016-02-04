### Listing quotas

Let's list the built in plans:

```sh
cf quotas
```

Output should be:

```sh
$ cf quotas
Getting quotas as admin...
OK

name      total memory limit   instance memory limit   routes   service instances   paid service plans
default   10G                  unlimited               1000     100                 allowed
```

As you can see, there is only one quota right now, which is the `default` quota.
