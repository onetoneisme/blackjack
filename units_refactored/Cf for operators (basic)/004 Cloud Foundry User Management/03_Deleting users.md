#### Deleting users

Let's delete the user we just created:

```sh
cf delete-user my-user -f
```

> **Tip**: note that we are forcing the confirmation with the `-f` modifier. If you don't include that modifier, the CLI will ask you for confirmation.

```
$ cf delete-user my-user -f
Deleting user my-user as admin...
OK
```

Now, we should create the user again so we can move forward:

```sh
cf create-user my-user "my-password"
```
