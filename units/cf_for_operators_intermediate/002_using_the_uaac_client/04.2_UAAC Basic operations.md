#### Checking permissions

To verify that our recently obtained security token has enough permissions to perform write operations to the UAAC, we need to do:

```sh
uaac contexts
```

And verify in the output that the `scope` property includes the `scim.write` permission.

#### Creating a secondary admin user

Let's create another user with admin permissions:

```sh
uaac user add MyAdminUser -p MySecretPassword --emails myemail@mydomain.com
```

The client will notify you if the user was successfully created.
Now, to grant the user admin permissions, run:

```sh
uaac member add cloud_controller.admin MyAdminUser
uaac member add uaa.admin MyAdminUser
uaac member add scim.read MyAdminUser
uaac member add scim.write MyAdminUser
```

To each one of these commands, the UAAC will respond with a `success` message.
Now, your new user is an `admin`!
