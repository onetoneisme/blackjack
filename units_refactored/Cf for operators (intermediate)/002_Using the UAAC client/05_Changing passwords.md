#### Changing passwords

First, we need to corroborate that the admin user has enough permissions to change anohter user password.

```sh
uaac context | grep scope
```

If you can't find the `password` value in the UAAC response, then you need to request for it.
Replace the `MY-PERMISSIONS` text with the existing permissions in the output of the previous command.

```sh
uaac client update admin --authorities "MY-PERMISSIONS password.write"
```

Now, your `admin` user will be able to change passwords. But, you will need to delete the current token to get the new one with the new permission:

```sh
uaac token delete
uaac token client get admin -s admin-secret
```

Now try:

```sh
uaac password set MyAdminUser -p AlwaysATempPassword
```

Next time that `MyAdminUser` signs in with that password to the CLI, it will be prompted for a new password.
