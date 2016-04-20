Cloud Foundry Services
======================

### ToC

1.  Introduction
2.  The Service Marketplace
3.  Creating services
4.  Binding and unbinding services
5.  Managing services
6.  User provided services

### Introduction

No application is an island. Every piece of code out there in the cloud will use, at some point in time, an external software. A database, a message queue, a mailing server... choose your flavor.
Cloud Foundry makes extremely easy to use any external piece of software. In the Cloud Foundry lingo, they are called *services*.

### The Service Marketplace

Getting information about the available services is vital for you to get information about which ones are available for consumption.
Cloud Foundry provides a catalog of services that you can explore and review, called the *Service Marketplace*.
To access it, simply do:

```
cf marketplace
```

Output should be:

```
$ cf marketplace
Getting services from marketplace in org my-org / space my-first-space as my-user...
OK

service   plans        description
p-mysql   100mb, 1gb   MySQL databases on demand

TIP:  Use 'cf marketplace -s SERVICE' to view descriptions of individual plans of a given service.
```

The output will show the name of the service, the available plans and a description of what the service do.
A *service plan* is a set of limits and rules that the service states. It can be a disk size limit for a database, a memory limit for a queue management system, or whatever set of limits to uniquely identify a subset of a service.
In this example, the plans for the **p-mysql** (a MySQL database) service are:
* 100 MB disk size limit database
* 1 GB disk size limit database

Although useful, this information will not show if the service is free or paid. There is a way to view the details of a service:

```
cf marketplace -s p-mysql
```

Output should be:

```
$ cf marketplace -s p-mysql
Getting service plan information for service p-mysql as my-user...
OK

service plan   description           free or paid
100mb          Shared MySQL Server   free
1gb            Shared MySQL Server   free
```

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
Dashboard: https://p-mysql.{{echo $CF_DOMAIN}}.xip.io/manage/instances/c353ea5a-6720-4db4-9207-235cb9032dee

Last Operation
Status: create succeeded
Message:
```

### Binding and unbinding services

So, how do you use this service you just created in your application?
To do this, you need to *bind* your service to your application.
Binding will allow your app to get the necessary information to use the service: connection URI, username, password, connection parameters, etc.

```
cf bind-service my-app my-app-db
```

Output should be:

```
$ cf bind-service my-app my-app-db
Binding service my-app-db to app my-app in org my-org / space my-first-space as my-user...
OK
TIP: Use 'cf restage' to ensure your env variable changes take effect
```

Cloud Foundry will inject, via environment variables, all the information required to use the service you just binded. Use the `cf env` command to see this information. You will get somthing like:

```
 "VCAP_SERVICES": {
   "p-mysql": [                                                                                                                                                                                              [0/250]
      {
       "credentials": {
        "hostname": "10.244.7.6",
        "jdbcUrl": "jdbc:mysql://10.244.7.6:3306/cf_c353ea5a_6720_4db4_9207_235cb9032dee?user=fX5sjC5m4yWxmVEZ\u0026password=ZNvVUJCiUxpMchN3",
        "name": "cf_c353ea5a_6720_4db4_9207_235cb9032dee",
        "password": "ZNvVUJCiUxpMchN3",
        "port": 3306,
        "uri": "mysql://fX5sjC5m4yWxmVEZ:ZNvVUJCiUxpMchN3@10.244.7.6:3306/cf_c353ea5a_6720_4db4_9207_235cb9032dee?reconnect=true",
        "username": "fX5sjC5m4yWxmVEZ"
       },
       "label": "p-mysql",
       "name": "my-app-db",
       "plan": "100mb",
       "tags": [
        "mysql"
       ]
      }
     ]
    }
   }
```

Now, let's try it in our application.

First, you need to have some code in place to use the service.
Go to the `cf-example-sinatra` application that you cloned before, and do:

```
git checkout with-service
```

Now, use your favorite text editor to open the `app.rb` file.
You will notice this chunk of code:

```ruby
vcap_services = JSON.parse(ENV['VCAP_SERVICES'])
db_user = vcap_services['p-mysql'].first['credentials']['username']
db_password = vcap_services['p-mysql'].first['credentials']['password']
db_host = vcap_services['p-mysql'].first['credentials']['hostname']
@db_name = vcap_services['p-mysql'].first['credentials']['name']
```

That is the whole magic.
The first line will parse the JSON object that Cloud Foundry injects into the `VCAP_SERVICES` environment variable.
The following lines will access the properties of that JSON object to get the necessary information to connect to the database and retrieve some data.

Now, push your app with `cf push my-app`

If you go to the URL provided by Cloud Foundry, you will see some information extracted from MySQL's *information schema*.

That's it!

Of course, there is the `unbind-service` command, which will detach a service instance from an application. **Don't** unbind the service right now, you will do it later.

```
cf unbind-service my-app my-sinatra-app-db
```

### Managing services

Services, of course, can mutate over the time. Cloud Foundry's CLI provides a series of commands to manage those changes.

#### Renaming services

If you want to change the name of your service, simply do:

```
cf rename-service my-app-db my-sinatra-app-db
```

This will rename your service instance.
>**WARNING**: Beware that, if you are discovering a service instance by the name, you will have to update your code and push your app again.

#### Updating services

A service update will upgrade or downgrade the service instance plan.

```
cf update-service my-sinatra-app-db -p 1gb
```

Now your service has been upgraded to the much larger **1gb** plan. You can verify it by doing `cf serice my-sinatra-app-db`.
>**WARNING**: Although the CLI has the update-service command by default, not all services support it. Please check the documentation of the service.

#### Deleting services

To delete a service, simply use the `delete-service` command:

```
cf delete-service my-sinatra-app-db
```

Output should be:

```
$ cf delete-service my-sinatra-app-db -f
Deleting service my-sinatra-app-db in org my-org / space my-first-space as my-user...
FAILED
Cannot delete service instance, apps are still bound to it
```

Hey, what happened? The command failed. Well, this is a safeguard. Cloud Foundry cannot delete a service that is still bound to an app. So, please **do** unbind the service as stated above and then, you can do `cf delete-service my-sinatra-app-db`.

Output should be:

```
$ cf delete-service my-sinatra-app-db

Really delete the service my-sinatra-app-db?> yes
Deleting service my-sinatra-app-db in org my-org / space my-first-space as my-user...
OK
```

There you go!!

Now, as a little exercise, please create again the `my-app-db` service instance with the **100mb** plan and bind it to the `my-app` application.

### User provided services

A *user provided service* is a neat way that Cloud Foundry allows you to use external services (services that aren't begin managed in Cloud Foundry) and treat then just like any other CF managed service.
Let's say that you have a MySQL database that is external to the Cloud Foundry deployment. Your application needs to connect to that database, so you need to provide the connection information and credentials. Hard coding that information is not only **not** adviced, but even very dangerous. A user provided service will provide your application with a way to connect to that service without having to change the way of getting the connection information.

#### Creating a User Provided Service

Let's create a fictional service:

```
cf cups my-fictional-service -p "host, port, db_name, username, password"
```
> **TIP**: Since the `create-user-provided-service` command is a little long, we are using it's alias, `cups`. Shorter and easier to read!

Output shoudl be:

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

```
cf cups my-other-fictional-service -p '{"host":"the-db-host","db_name":"the-db-name","username":"the-user-name","password":"the-super-secret-user-password","db_port":"3306"}'
```

Now, bind the service to the `my-app` application, just like any other regular service with `cf bind-service my-app my-fictional-service`
If you execute `cf env my-app`, you will be able to see the service credentials under the `user-provided` key, ready to use!
Also, check how the user provided services looks like when you do `cf services` and `cf service my-fictional-service`.

#### Modifying a User Provided Service

Now, let's say that you need to modify the user provided service with a new key to specify the port:

```
cf uups my-fictional-service -p '{"host":"the-db-host","db_name":"the-db-name","username":"the-user-name","password":"the-super-secret-user-password","db_port":"3306"}'
```
>**Tip**: `uups` is an alias for `update-user-provided-service`. There is no interactive mode for this command.

Now, unbind the service from the `my-app` application and bind it again. Check the `cf env my-app` result, and you will see the changes there!

Do you want to see it in action?
Go to the `cf-example-sinatra` directory and do:

```
git checkout with-ups
```

Now, do `cf bs my-app my-fictional-service && cf push my-app`
>**Tip**: instead of using `bind-service`, we are using it's alias, `bs`.

Go to the URL that CF provides, and you will see the credentials you just entered with some service metadata.

#### Deleting a User Provided Service

Deleting a user provided service is as easy as deleting a service:

```
cf delete-service my-other-fictional-service -f
```

And you are done!!
