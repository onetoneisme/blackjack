#### Getting info about users and roles

How do we get information about what user is assigned to what role in an organization or a space?

There are two very useful commands for this: `org-users` and `space-users`.

Try the first one:

```sh
cf org-users my-org
```

The output should be:

```
$ cf org-users my-org
Getting users in org my-org as admin...

ORG MANAGER

BILLING MANAGER

ORG AUDITOR
  my-user
```

Notice that the user `my-user` appears under `Org Auditor`, just as we have assigned it before.
The same can be done for spaces:

```sh
cf space-users my-org my-first-space
```

The output should be:

```
$ cf space-users my-org my-first-space
Getting users in org my-org / space my-first-space as admin

SPACE MANAGER
  admin

SPACE DEVELOPER
  admin
  my-user

SPACE AUDITOR
```
