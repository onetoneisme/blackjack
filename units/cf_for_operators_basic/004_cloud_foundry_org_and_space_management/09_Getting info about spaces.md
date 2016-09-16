#### Getting info about spaces

Getting info about a space is as simple as:

```sh
cf space my-first-space
```
This will return a good deal of info about the space we have specified.
Don't worry about what all that information means. We'll get to it later on.

```
$ cf space my-first-space
Getting info for space my-first-space in org my-org as admin...
OK

my-first-space
                 Org:               my-org
                 Apps:
                 Domains:           {{echo $CF_DOMAIN}}.xip.io
                 Services:
                 Security Groups:   public_networks, dns, services, load_balancer, user_bosh_deployments
                 Space Quota:

```
