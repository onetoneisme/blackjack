### Managing organizations

To manage organizations, spaces, and assign permissions, you have to be logged in as an `admin` user, or a user with admin permissions.

To do this, you can use the `cf auth` command as we used it in the previous lesson (Quick Start):

```sh
cf auth admin admin
```

Once you are logged in, check your top-level organizational structure with:

```
cf orgs
```

This command will show you a list of organizations that you might have created previously.
