### The Service Marketplace

Getting information about the available services is vital if you need to know which ones are available for consumption.
Cloud Foundry provides a catalog of services that you can explore and review, called the *Service Marketplace*.
To access it, just do:

```exec
cf marketplace
```

The output will show the name of the service, available plans, and a description of what the service does.
A *service plan* is a set of limits and rules that the service states. It can be a disk size limit for a database, a memory limit for a queue management system, or any set of limits that uniquely identifies a subset of a service.
In this example, the plans for the `p-mysql` (a MySQL database) service are:
* a database with a 512 MB disk size limit
* a database with a 1 GB disk size limit 

Although useful, this information will not show if the service is free or paid. There is another way to view the details of a service:

```exec
cf marketplace -s p-mysql
```

