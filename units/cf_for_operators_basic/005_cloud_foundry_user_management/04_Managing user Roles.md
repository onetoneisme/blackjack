### Managing user roles

Cloud Foundry has a built-in RBAC (Role Based Access Control) system that allows you to control what a user can or cannot do inside an organization or a space.

The basic roles provided by Cloud Foundry are well described in the official documentation:

* [Organization roles](https://docs.cloudfoundry.org/concepts/roles.html#org-roles)
* [Space roles](https://docs.cloudfoundry.org/concepts/roles.html#space-roles)

What a user is going to be able to do in Cloud Foundry is the combination of the roles that the administrator has set for that user.

Roles can be set very easily, using the `set-org-role` and `set-space-role` commands from the CLI.

Let's set one organization role and one space role for the user we have just created:

```sh
cf set-org-role my-user my-org OrgAuditor
```

The output should be:

```
$ cf set-org-role my-user my-org OrgAuditor
Assigning role OrgAuditor to user my-user in org my-org as admin...
OK
```

> **Tip:** If you would like to see the roles available for you to choose from, simply do `cf set-org-role` and you will get a listing of the roles. The same applies to the `set-space-role` command.

Now, we are going to assign a space role. Remember that a user can have any combination of roles.

```sh
cf set-space-role my-user my-org my-first-space SpaceDeveloper
```

The output should be:

```
$ cf set-space-role my-user my-org my-first-space SpaceDeveloper
Assigning role SpaceDeveloper to user my-user in org my-org / space my-first-space as admin...
OK
```
