### Space quotas

Space quotas are the same as regular quotas, but they can be assigned to specific spaces instead of Orgs. The only difference is that you can remove a quota from a space.

Creating (`create-space-quota`), updating (`update-space-quota`) and deleting (`delete-space-quota`) work exactly as their "regular" quota counterparts. Setting and unsetting the space quota to an space have minor differences:

Create a space quota:

```sh
cf create-space-quota small-space-quota -i 512M -m 2048M -r 10 -s 5
```

Output should be:

```
$ cf create-space-quota small-space-quota -i 512M -m 2048M -r 10 -s 5
Creating space quota small-space-quota for org my-org as admin...
OK
```

Now modify it:

```sh
cf update-space-quota small-space-quota -i 128M
```

Output should be:

```
$ cf update-space-quota small-space-quota -i 128M
Updating space quota small-space-quota as admin...
OK
```

Assign the quota to your space:

```sh
cf set-space-quota my-first-space small-space-quota
```

Output should be:

```
$ cf set-space-quota my-first-space small-space-quota
Assigning space quota small-space-quota to space my-first-space as admin...
OK
```

Now, get the information for your space:

```sh
cf space my-first-space
```

Output should be:

```
$ cf space my-first-space
Getting info for space my-first-space in org my-org as admin...
OK

my-first-space
                 Org:               my-org
                 Apps:
                 Domains:           {{echo $CF_DOMAIN}}
                 Services:
                 Security Groups:   public_networks, dns, services, load_balancer, user_bosh_deployments
                 Space Quota:       small-space-quota (2G memory limit, 128M instance memory limit, 10 routes, 5 services, paid services disallowed)
```

As you can see, the space quota now shows in the space information, confirming that it was added.

The biggest difference between a Space quota and a Org quota is that a Space quota can be unassigned:

```sh
cf unset-space-quota my-first-space small-space-quota
```

Output should be:

```
$ cf unset-space-quota my-first-space small-space-quota
Unassigning space quota small-space-quota from space my-first-space as admin...
OK
```

Before ending, re set the previously unset space quota to the `my-first-space`.

Also, you can list all the space quotas or get information about an specific one by using `space-quotas` and `space-quota` commands.

Try them!
