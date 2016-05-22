#### Creating a user

Creating a user is as simple as:
```sh
cf create-user my-user "my-password"
```

Cloud Foundry will then create the user and show the result:

```
$ cf create-user my-user "my-password"
Creating user my-user as admin...
OK

TIP: Assign roles with 'cf set-org-role' and 'cf set-space-role'
```

Note that the user has been created, but they are not assigned to any org or space.
