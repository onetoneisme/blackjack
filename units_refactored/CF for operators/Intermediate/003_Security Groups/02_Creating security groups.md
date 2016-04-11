### Creating security groups

To create a security group, the CLI provides the `create-security-group` command.

First, lets create a security group that will allow access to a fictional MySQL server running in our local instance:

```sh
$ echo '[{"protocol":"tcp", "destination":"0.0.0.0/24","ports":"3306"}]' > mysql-sg.json
```

Now that you have the file created, you can use the CLI:

```sh
cf create-security-group mysql-sg mysql-sg.json
```

Output will show that the security group was created correctly:

```sh
$ cf create-security-group mysql-sg mysql-sg.json
Creating security group mysql-sg as admin
OK
```
