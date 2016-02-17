### Managing Organizations

To manage organizations, spaces and assign permissions, you have to be logged in as an *admin* user, or a user with admin permissions.

To do this, you can use the `cf auth` command as we used it in the previous lesson (Quick Start).

```sh
cf auth admin admin
```

Once you are logged in, lets find out your top-level organizational structure:

```
cf orgs
```

This command will show you a list of organizations that you might have created previously.
