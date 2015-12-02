# Cloud Foundry User Management

### Objectives

### ToC

1. Introduction
2. Creating and deleting users
3. Managing user Roles

### Introduction

Cloud Foundry provides a very convenient way to manage users, roles and assign permissions.

We are going to explore the options for creating and deleting users, as well as assigning roles to those users for Organizations and Spaces as well.

#### Creating a user

Creating a user is as simple as:
```sh
cf create-user my-user "my-password"
```

Cloud Foundry then will create the user, and show the result:

```sh
$ cf create-user my-user "my-password"
Creating user my-user as admin...
OK

TIP: Assign roles with 'cf set-org-role' and 'cf set-space-role'
```

Note that the user has been created, but it still not assigned to any Org or Space.

#### Deleting users

Let's delete the user we just created:

```sh
cf delete-user my-user -f
```

> **Tip**: note that we are forcing the confirmation with the `-f` modifier. If you don't include that modifier, the CLI will ask you for confirmation.

```sh
$ cf delete-user my-user -f
Deleting user my-user as admin...
OK
```

Now, we should create the user again so we can move forward:

```sh
cf create-user my-user "my-password"
```

### Managing user Roles

Cloud Foundry has a built in RBAC (Role Based Access Control) system that will allow you to control what a user can or cannot do inside an Organization or an Space.

The basic provided roles are perfectly described in the official documentation:

* [Organization roles](https://docs.cloudfoundry.org/concepts/roles.html#org-roles)
* [Space roles](https://docs.cloudfoundry.org/concepts/roles.html#space-roles)

What a user is going to be able to do in Cloud Foundry is the combination of the roles that the administrator set for that user.

Setting roles is very easy, using the `set-org-role` and `set-space-role` command from the CLI.

Let's set one organization role and one space role for the user we just created:

```sh
cf set-org-role my-user my-org OrgAuditor
```

Output should be:

```sh
$ cf set-org-role my-user my-org OrgAuditor
Assigning role OrgAuditor to user my-user in org my-org as admin...
OK
```

> **Tip:** If you want to know the roles available for you to choose from, simply do `cf set-org-role` and you will get a listing of the roles. Same applies for the `set-space-role` command.

Now, we are going to assign a space role. Remember that a user can have any combination of roles.

```sh
cf set-space-role my-user my-org my-first-space SpaceDeveloper
```

Output should be:

```sh
$ cf set-space-role my-user my-org my-first-space SpaceDeveloper
Assigning role SpaceDeveloper to user my-user in org my-org / space my-first-space as admin...
OK
```

#### Getting info about users and roles

How do we get information about what user is assigned to what role in an organization or an space?

There are two very useful commands for this: `org-users` and `space-users`.

Try the first one:

```sh
cf org-users my-org
```

Output should be:

```sh
$ cf org-users my-org
Getting users in org my-org as admin...

ORG MANAGER

BILLING MANAGER

ORG AUDITOR
  my-user
```

Notice that the user `my-user` appears under *Org Auditor*, just as we assigned it before.
Same can be done for spaces:

```sh
cf space-users my-org my-first-space
```

Output should be:

```sh
$ cf space-users my-org my-first-space
Getting users in org my-org / space my-first-space as admin

SPACE MANAGER
  admin

SPACE DEVELOPER
  admin
  my-user

SPACE AUDITOR
```

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
