### Binding security groups

We have a security group created. How do we put it to work?

To do this, we need to *bind* the security group to either a space, or a security group set.

#### Binding to spaces

Easy!

```sh
cf bind-security-group mysql-sg my-org my-first-space
```
> **Tip**: A space may belong to more than one application security group.

Output should be:

```
$ cf bind-security-group mysql-sg my-org my-first-space
Assigning security group mysql-sg to space my-first-space in org my-org as admin...
OK



TIP: Changes will not apply to existing running applications until they are restarted.
```

#### Binding to security group sets

To create a rule to be applied to every space in every *org* of your deployment, bind the group to a security group set.

Depending on what security group set you want to use, there are two different commands (do not run these commands, we'll get back to them later on):

```sh
cf bind-staging-security-group mysql-sg
```

or

```sh
cf bind-running-security-group mysql-sg
```
