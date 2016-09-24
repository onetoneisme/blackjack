#### Creating a user-provided service

Let's create a fictional service:

```sh
cf cups my-fictional-service -p "host, port, db_name, username, password"
```
> **TIP**: Since the `create-user-provided-service` command is a little long, we are using its alias, `cups`. It's shorter and easier to read!

The output should be:

```
$ cf cups my-fictional-service -p "host, db_name, username, password"

host> the-db-host

db_name> the-db-name

username> the-user-name

password> the-super-secret-user-password
Creating user provided service my-fictional-service in org my-org / space my-first-space as my-user...
OK
```

Note that the CLI will ask you for values for each key that you put between the quotes.
If you want to create the service non-interactively, just do:

```sh
cf cups my-other-fictional-service -p '{"host":"the-db-host","db_name":"the-db-name","username":"the-user-name","password":"the-super-secret-user-password","db_port":"3306"}'
```

Now, bind the service to the `my-app` application, just like any other regular service with `cf bind-service my-app my-fictional-service`.
If you execute `cf env my-app`, you will be able to see the service credentials under the `user-provided` key, ready to use!
Also, check out what the user-provided services look like when you do `cf services` and `cf service my-fictional-service`.
