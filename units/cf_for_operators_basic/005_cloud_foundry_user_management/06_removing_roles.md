#### Removing roles

You might have noticed in the previous step that the user `admin` has `Space Manager` and `Space Developer` roles. This is because Cloud Foundry will assign those roles automatically when an `admin` user creates a space.

You can remove roles from a `user/Org` or `user/Space` combination, using the `unset-org-role` and `unset-space-role` commands.

Let's leave `admin` as a `Space Manager`,  but remove the `Space Developer` role.

```sh
cf unset-space-role admin my-org my-first-space SpaceDeveloper
```

The output should be:

```
$ cf unset-space-role admin my-org my-first-space SpaceDeveloper
Removing role SpaceDeveloper from user admin in org my-org / space my-first-space as admin...
OK
```

If you run the `cf space-users` command again, you should get:

```
$ cf space-users my-org my-first-space
Getting users in org my-org / space my-first-space as admin

SPACE MANAGER
  admin

SPACE DEVELOPER
  my-user

SPACE AUDITOR
```
