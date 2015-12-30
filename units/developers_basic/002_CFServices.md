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
Dashboard: https://p-mysql.bosh-lite.com/manage/instances/c353ea5a-6720-4db4-9207-235cb9032dee

Last Operation
Status: create succeeded
Message:
```

### Binding and unbinding services



### Managing services
