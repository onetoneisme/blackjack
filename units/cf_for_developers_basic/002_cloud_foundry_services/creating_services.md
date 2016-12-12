### Creating services

To use a service plan and *instantiate* it, you need to create a *service*. A *service* is an instance of a *service plan* that you can use in your application.
Let's create a database for our application:

```exec
cf create-service p-mysql 512mb my-app-db
```

The parameters of the `create-service` command are:

* the name of the software service
* the plan identifier
* the name of *your* service (This name is very important, since it is the one you are going to use for your application.)

You can explore which services are instantiated by doing:

```exec
cf services
```

Also, getting detailed information for a service is very easy:

```exec
cf service my-app-db
```

