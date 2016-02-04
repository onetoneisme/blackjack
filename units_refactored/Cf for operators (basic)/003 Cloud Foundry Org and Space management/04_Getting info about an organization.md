#### Getting info about an organization

A very good way to get information about the organization you just created is by using the `cf org` command:

```
cf org my-org
```

The result will be something like:

```
$ cf org my-org
Getting info for org my-org as admin...
OK

my-org:
          domains:        {{cf-get-instance-ip}}.xip.io
          quota:          default (10240M memory limit, Unlimited instance memory limit, 1000 routes, 100 services, paid services allowed)
          spaces:
          space quotas:

```

>**Tip:** note the *singular* vs. the *plural* noun used in `cf orgs`. Using the plural will get you a list of the objects represented by the noun, and the singular version will do something else, usually get details. This is a very common pattern in Cloud Foundry's CLI.
>
