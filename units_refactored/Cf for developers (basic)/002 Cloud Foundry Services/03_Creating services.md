### Creating services

To use a service plan and *instantiate* it, you need to create a *service*. A *service* is an instance of a *service plan* that you can use in your application.
Let's create a database for our application:

```
cf create-service p-mysql 100mb my-app-db
```

Output should be:

```
$ cf create-service p-mysql 100mb my-app-db
Creating service my-app-db in org my-org / space my-first-space as my-user...
OK
```

The parameters of the **create-service** command are: the name of the software service, the plan identifier and the name of the *your* service. This name is very important, since it is the one you are going to use for your application.

You can explore which services are instantiated by doing:

```
cf services
```

Output should be:

```
$ cf services
Getting services in org my-org / space my-first-space as my-user...
OK

name        service   plan    bound apps   last operation
my-app-db   p-mysql   100mb                create succeeded
```

Also, getting detailed information for a service is very easy:

```
cf service my-app-db
```

Output should be:

```
$ cf service my-app-db

Service instance: my-app-db
Service: p-mysql
Plan: 100mb
Description: MySQL databases on demand
Documentation url:
Dashboard: https://p-mysql.{{cf-get-instance-ip}}.xip.io/manage/instances/c353ea5a-6720-4db4-9207-235cb9032dee

Last Operation
Status: create succeeded
Message:
```
