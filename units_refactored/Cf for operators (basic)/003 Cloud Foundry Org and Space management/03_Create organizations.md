#### Create organizations

Now, to add an organization, simpy do:

```sh
cf create-org my-org
```

You will see something like:

```sh
$ cf create-org my-org
Creating org my-org as admin...
OK

TIP: Use 'cf target -o my-org' to target new org
```

Now, try again listing the existing organizations with `cf orgs`
Your new organization should be listed there.
