# Cloud Foundry User Management

### Objectives

### ToC

1. Introduction
2. Creating and deleting users

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

### Assigning Roles

Cloud Foundry has a built in RBAC (Role Based Access Control) system that will allow you to control what a user can or cannot do inside an Organization or an Space.
