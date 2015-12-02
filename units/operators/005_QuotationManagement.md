# Quota Management in Cloud Foundry

### ToC

1. Introduction
2. Listing quotas
3. Getting quota info
4. Creating and managing quotas
5. Assigning quotas to spaces

### Introduction

*How do you manage resources in Cloud Foundry?*

That is a very common question that have a very good answer.

Cloud Foundry offers a very convenient way of managing available resources such as disk, memory and even paid services.
This is done through **Quotas**, or namesets that are easy way to remember a configuration for an specific resource management plan.

A quota structure is comprised of:

* **name**: a name you will use to identify the plan. Should be easy to remember.
* **instance memory limit**: the maximum amount of memory that an instance can use. Examples: `256M`, `2G`.
* **memory limit**: the maximum amount of memory usage allowed in the plan. Examples: `512M`, `1G`.
* **total routes**: the maximum amount of routes allowed for the plan.
* **total services**: the maximum amount of services allowed in the plan.
* **non basic services allowed**: setting this value to `true` will allow users to provision non-free service plans.

### Listing quotas

Let's list the built in plans:

```sh
cf quotas
```

Output should be:

```sh
$ cf quotas
Getting quotas as admin...
OK

name      total memory limit   instance memory limit   routes   service instances   paid service plans   
default   10G                  unlimited               1000     100                 allowed   
```

As you can see, there is only one quota right now, which is the `default` quota.

### Getting quota info

There is a way to get this information in a more wasy to read way:

```sh
cf quota default
```

Output should be:

```sh
$ cf quota default
Getting quota default info as admin...
OK

Total Memory         10G   
Instance Memory      unlimited   
Routes               1000   
Services             100   
Paid service plans   allowed
```

### Creating and managing quotas

Creating a quota is very straightforward. Let's see the options:

```sh
cf help create-quota
```

Output should be:

```sh
$ cf help create-quota
NAME:
   create-quota - Define a new resource quota

USAGE:
   cf create-quota QUOTA [-m TOTAL_MEMORY] [-i INSTANCE_MEMORY] [-r ROUTES] [-s SERVICE_INSTANCES] [--allow-paid-service-plans]

OPTIONS:
   -i 				Maximum amount of memory an application instance can have (e.g. 1024M, 1G, 10G). -1 represents an unlimited amount.
   -m 				Total amount of memory (e.g. 1024M, 1G, 10G)
   -r 				Total number of routes
   -s 				Total number of service instances
   --allow-paid-service-plans	Can provision instances of paid service plans
```

> **Reminder:** It is very easy to get help on a CLI command by doing `cf help command-name`.

Now that we know what modifiers to use, we can create our first quota:

```sh
cf create-quota small-quota -i 512M -m 2048M -r 10 -s 5
```

Output should be:

```sh
$ cf create-quota small-quota -i 512M -m 2048M -r 10 -s 5
Creating quota small-quota as admin...
OK
```

This command created a quota with a max instance memory use (`-i`) of 512M, a max memory allocation for all instances (`-m`) of 2048M, 10 routes max (`-r`) and a top usage of 5 services (`-s`). Note that you didn't use the `--allow-paid-service-plans` flag, which immediately sets that parameter to `false`.

If you list the quotas again, you'll see that your newly created quota is there.

```sh
$ cf quotas
Getting quotas as admin...
OK

name          total memory limit   instance memory limit   routes   service instances   paid service plans   
default       10G                  unlimited               1000     100                 allowed   
small-quota   2G                   512M                    10       5                   disallowed
```

Let's create a second quota, a larger one that allows paid plans:

```sh
cf create-quota large-quota -i 2048M -m 10G -r 100 -s 20 --allow-paid-service-plans
```

Output should be:

```sh
$ cf create-quota large-quota -i 2048M -m 10G -r 100 -s 20 --allow-paid-service-plans
Creating quota large-quota as admin...
OK
```

Listing the quotas again will show that `large-quota` has been created and is available.
