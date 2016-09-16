#### Create organizations

Now, to add an organization, simpy do:

```sh
cf create-org my-org
```

You will see something like:

```
$ cf create-org my-org
Creating org my-org as admin...
OK

TIP: Use 'cf target -o my-org' to target new org
```

Now, try listing the existing organizations with `cf orgs` again.
Your new organization should be listed in the output.
