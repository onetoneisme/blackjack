#### Creating a user

Creating a user is as simple as:
```sh
cf create-user my-user "my-password"
```

Cloud Foundry then will create the user, and show the result:

```sh
$ cf create-user my-user "my-password"
Creating user my-user as admin...
OK

TIP: Assign roles with 'cf set-org-role' and 'cf set-space-role'
```

Note that the user has been created, but it still not assigned to any Org or Space.
