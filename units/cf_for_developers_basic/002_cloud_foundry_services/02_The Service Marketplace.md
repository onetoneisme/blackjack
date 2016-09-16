### The Service Marketplace

Getting information about the available services is vital if you need to know which ones are available for consumption.
Cloud Foundry provides a catalog of services that you can explore and review, called the *Service Marketplace*.
To access it, just do:

```sh
cf marketplace
```

The output should be:

```
$ cf marketplace
Getting services from marketplace in org my-org / space my-first-space as my-user...
OK

service      plans        description
p-mysql      512mb, 1gb   MySQL databases on demand
p-rabbitmq   standard     RabbitMQ is a robust and scalable high-performance multi-protocol messaging broker.
p-redis      shared-vm    Redis service to provide a key-value store

TIP:  Use 'cf marketplace -s SERVICE' to view descriptions of individual plans of a given service.
```

The output will show the name of the service, available plans, and a description of what the service does.
A *service plan* is a set of limits and rules that the service states. It can be a disk size limit for a database, a memory limit for a queue management system, or any set of limits that uniquely identifies a subset of a service.
In this example, the plans for the `p-mysql` (a MySQL database) service are:
* a database with a 512 MB disk size limit
* a database with a 1 GB disk size limit 

Although useful, this information will not show if the service is free or paid. There is another way to view the details of a service:

```sh
cf marketplace -s p-mysql
```

The output should be:

```
$ cf marketplace -s p-mysql
Getting service plan information for service p-mysql as my-user...
OK

service plan   description           free or paid
512mb          Shared MySQL Server   free
1gb            Shared MySQL Server   free
```
