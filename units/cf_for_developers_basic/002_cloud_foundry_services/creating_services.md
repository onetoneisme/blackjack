### Creating services

To use a service plan and *instantiate* it, you need to create a *service*. A *service* is an instance of a *service plan* that you can use in your application.
Let's create a database for our application:

```exec
cf create-service p-mysql 512mb my-app-db
```

The output should be:

```
$ cf create-service p-mysql 512mb my-app-db
Creating service my-app-db in org my-org / space my-first-space as my-user...
OK
```

The parameters of the `create-service` command are:

* the name of the software service
* the plan identifier
* the name of *your* service (This name is very important, since it is the one you are going to use for your application.)

You can explore which services are instantiated by doing:

```exec
cf services
```

The output should be:

```
$ cf services
Getting services in org my-org / space my-first-space as my-user...
OK

name        service   plan    bound apps   last operation
my-app-db   p-mysql   512mb                create succeeded
```

Also, getting detailed information for a service is very easy:

```exec
cf service my-app-db
```

The output should be:

```
$ cf service my-app-db

Service instance: my-app-db
Service: p-mysql
Plan: 512mb
Description: MySQL databases on demand
Documentation url:
Dashboard: https://p-mysql.{{echo $CF_DOMAIN}}manage/instances/c353ea5a-6720-4db4-9207-235cb9032dee

Last Operation
Status: create succeeded
Message:
```
