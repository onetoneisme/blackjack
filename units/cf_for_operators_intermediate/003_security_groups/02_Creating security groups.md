### Creating security groups

To create security groups, the CLI provides the `create-security-group` command.

First, let's create a security group that will allow access to a fictional MySQL server, running on our local instance:

```sh
$ echo '[{"protocol":"tcp", "destination":"0.0.0.0/24","ports":"3306"}]' > mysql-sg.json
```

Now that you have created the file, you can use the CLI:

```sh
cf create-security-group mysql-sg mysql-sg.json
```

The output will show that the security group was created correctly:

```sh
$ cf create-security-group mysql-sg mysql-sg.json
Creating security group mysql-sg as admin
OK
```
