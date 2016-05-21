#### Changing passwords

First, we need to confirm the admin user has enough permissions to change another user's password.

```sh
uaac context | grep scope
```

If you can't find the `password` value in the UAAC response, then you need to request it.
Replace the `MY-PERMISSIONS` text with the existing permissions from the output of the previous command.

```sh
uaac client update admin --authorities "MY-PERMISSIONS password.write"
```

Now, your `admin` user will be able to change passwords. However, you will need to delete the current token to get another one with the new permissions:

```sh
uaac token delete
uaac token client get admin -s admin-secret
```

Now, try:

```sh
uaac password set MyAdminUser -p AlwaysATempPassword
```

Next time `MyAdminUser` tries to sign in into the CLI with that password, they will be prompted for a new password.
