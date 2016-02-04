#### Removing roles

In the previous step, you can notice that the user `admin` is set as an *Space Manager* and *Space Developer* roles. This is because Cloud Foundry will assign those roles automatically when an *admin* user creates a space.

You can remove roles from a user/Org or user/Space combination by using the `unset-org-role` and `unset-space-role` commands.

Let's leave `admin` as a *Space Manager*  but remove it from *Space Developer*.

```sh
cf unset-space-role admin my-org my-first-space SpaceDeveloper
```

Output should be:

```sh
$ cf unset-space-role admin my-org my-first-space SpaceDeveloper
Removing role SpaceDeveloper from user admin in org my-org / space my-first-space as admin...
OK
```

If you run the `cf space-users` command again, you should get:

```sh
$ cf space-users my-org my-first-space
Getting users in org my-org / space my-first-space as admin

SPACE MANAGER
  admin

SPACE DEVELOPER
  my-user

SPACE AUDITOR
```