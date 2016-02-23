### Scaling up and down

Scaling up and down an application deployed in CF is easy.

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

One **very** important thing to know about how Cloud Foundry works with scaling applications is that when an application that has many instances is restarted, they get restarted in sequence. Why? Simply to have a zero-downtime deployment. When an instance of your application is down, the Cloud Foundry Router will NOT route packages to that instance. Simple and effective!
