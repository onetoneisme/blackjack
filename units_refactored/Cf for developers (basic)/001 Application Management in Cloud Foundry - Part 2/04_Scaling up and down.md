### Scaling up and down

Scaling up and down an application deployed in CF is really easy.

```
$ cf help scale
NAME:
   scale - Change or view the instance count, disk space limit, and memory limit for an app

USAGE:
   cf scale APP_NAME [-i INSTANCES] [-k DISK] [-m MEMORY] [-f]

OPTIONS:
   -i   Number of instances
   -k   Disk limit (e.g. 256M, 1024M, 1G)
   -m   Memory limit (e.g. 256M, 1024M, 1G)
   -f   Force restart of app without prompt
```

As you can see, Cloud Foundry allows you to have a complete control over the size and number of instances of your applications. However, you must take in consideration the following factors:

* You can scale up and down with the same command.
* Scaling vertically (modifying any of the instance size parameters) will *restart* the application.
* Scaling horizontally will NOT restart the application.
* There is a limit on the amount of instances that can be created according to the Quotas and Space Quotas set.

First, scale the memory limit of the `my-app` application:

```
cf scale my-app -m 512M
```

Output should be:

```
$ cf scale my-app  -m 512M

This will cause the app to restart. Are you sure you want to scale my-app?> y

Scaling app my-app in org my-org / space my-first-space as my-user...
OK
Stopping app my-app in org my-org / space my-first-space as my-user...
OK

Starting app my-app in org my-org / space my-first-space as my-user...

1 of 1 instances running

App started


OK

App my-app was started using this command `bundle exec rackup config.ru -p $PORT`

Showing health and status for app my-app in org my-org / space my-first-space as my-user...
OK

requested state: started
instances: 1/1
usage: 512M x 1 instances
urls: my-app.52.90.231.243.xip.io
last uploaded: Wed Dec 23 16:27:56 UTC 2015

     state     since                    cpu    memory          disk      details
#0   running   2015-12-23 01:33:06 PM   0.0%   46.9M of 512M   0 of 1G
```

As you can see, the application was restarted.
Now, scale up just the number of instances to 2:

```
cf scale my-app -i 2
```

Output should be:

```
$ cf scale my-app -i 2
Scaling app my-app in org my-org / space my-first-space as my-user...
OK
```

Now, check the status of the application:

```
cf app my-app
```

You can see that there are now two instances running of `my-app`!

Since this is a VERY small application that barelly consumes memory, we can shrink down the memory usage to 64M safely:

```
cf scale my-app -m 64M -f
```

You will see that the application is restarted.
Now check the status with the `cp app my-app` command.
You can verify that both instances were restarted!
One **very** important thing to know about how Cloud Foundry works with scaling applications is that when an application that has many instances is restarted, they get restarted in sequence. Why? Simply to have a zero-downtime deployment. When an instance of your application is down, the Cloud Foundry Router will NOT route packages to that instance. Simple and effective!
