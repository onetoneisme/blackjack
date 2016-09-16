### Space quotas

Space quotas are the same as regular quotas, but they can be assigned to specific spaces instead of orgs. The only difference is that, unlike with orgs, you can remove a quota from a space.

Creating (`create-space-quota`), updating (`update-space-quota`), and deleting (`delete-space-quota`) work exactly as their "regular" quota counterparts. Setting and unsetting space quotas to a space have some minor differences:

Create a space quota with:

```sh
cf create-space-quota small-space-quota -i 512M -m 2048M -r 10 -s 5
```

The output should be:

```
$ cf create-space-quota small-space-quota -i 512M -m 2048M -r 10 -s 5
Creating space quota small-space-quota for org my-org as admin...
OK
```

Now modify it:

```sh
cf update-space-quota small-space-quota -i 128M
```

The output should be:

```
$ cf update-space-quota small-space-quota -i 128M
Updating space quota small-space-quota as admin...
OK
```

Assign the quota to your space:

```sh
cf set-space-quota my-first-space small-space-quota
```

The output should be:

```
$ cf set-space-quota my-first-space small-space-quota
Assigning space quota small-space-quota to space my-first-space as admin...
OK
```

Now, get the information for your space:

```sh
cf space my-first-space
```

The output should be:

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

As you can see, the space quota now appears in the space information, confirming that it was added successfully.

The biggest difference between a space quota and an org quota is that a space quota can be unassigned:

```sh
cf unset-space-quota my-first-space small-space-quota
```

The output should be:

```
$ cf unset-space-quota my-first-space small-space-quota
Unassigning space quota small-space-quota from space my-first-space as admin...
OK
```

Before you complete this section, set the previously unset space quota back to the `my-first-space`.

Also, you can list all the space quotas or get information about a specific one, using the `space-quotas` and `space-quota` commands.

Try them!
