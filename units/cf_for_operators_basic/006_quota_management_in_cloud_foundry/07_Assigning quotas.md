### Assigning quotas

Now that we have created a quota, we can apply it to an org:

```sh
cf set-quota my-org large-quota
```

The output should be:

```
$ cf set-quota my-org large-quota
Setting quota large-quota to org my-org as admin...
OK
```

If you query `my-org` details, you will see that the quota has been assigned to it:

```sh
cf org my-org
```

The output should be:

```
$ cf org my-org
Getting info for my-org as admin...
OK

my-org:
          domains:        {{echo $CF_DOMAIN}}
          quota:          large-quota (10240M memory limit, 2048M instance memory limit, 100 routes, 20 services, paid services disallowed)
          spaces:         my-first-space
          space quotas:
```

> **Caveat**: It is not possible to remove a quota from an org, once it has been assigned.
