#### Getting info about spaces

Getting info about an space is as simple as:

```sh
cf space my-first-space
```
This will offer a good deal of info about the space we are enquiring.
Don't worry about what does that information means, we'll get to it later on.

```
$ cf space my-first-space
Getting info for space my-first-space in org my-org as admin...
OK

my-first-space
                 Org:               my-org
                 Apps:
                 Domains:           {{cf-get-intance-ip}}.xip.io
                 Services:
                 Security Groups:   public_networks, dns, services, load_balancer, user_bosh_deployments
                 Space Quota:

```
