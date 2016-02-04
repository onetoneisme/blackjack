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
