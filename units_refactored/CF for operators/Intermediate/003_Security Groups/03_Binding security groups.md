### Binding security groups

We have successfully created a security group. How do we enable it, so that it works?

To do this, we need to *bind* the security group to either a space or a security group set.

#### Binding to spaces

Easy!

```sh
cf bind-security-group mysql-sg my-org my-first-space
```
> **Tip**: A space may belong to more than one application security group.

The output should be:

```
$ cf bind-security-group mysql-sg my-org my-first-space
Assigning security group mysql-sg to space my-first-space in org my-org as admin...
OK



TIP: Changes will not apply to existing running applications until they are restarted.
```

#### Binding to security group sets

To create a rule to be applied to every space in every org of your deployment, bind the group to a security group set.

Depending on what security group set you want to use, there are two different commands (do not run these commands yet, we will get back to them later on):

```sh
cf bind-staging-security-group mysql-sg
```

or

```sh
cf bind-running-security-group mysql-sg
```
