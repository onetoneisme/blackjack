### Assigning quotas

Now that we have a quota created, we can apply it to an Org:

```sh
cf set-quota my-org large-quota
```

Output should be:

```sh
$ cf set-quota my-org large-quota
Setting quota large-quota to org my-org as admin...
OK
```

If you query `my-org` details, you will see that the quota has been assigned:

```sh
cf org my-org
```

Output should be:

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

> **Caveat**: It is not possible to remove a quota from an Org once it has been assigned.
