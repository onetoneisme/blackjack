### Scaling up and down

Scaling applications deployed to CF up and down is easy:

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

Cloud Foundry gives users full control over the size and number of their application instances. However, you must take the following into consideration:

* Scaling up and down can be done with the same command.
* Scaling vertically (modifying any of the instance size parameters) will *restart* the application.
* Scaling horizontally will NOT restart the application.
* The number of instances that can be created is limited by the *quotas* and *space quotas* you set.

**One more very important thing to know about how Cloud Foundry works with scaling applications:** when an application that has many instances is restarted, they get restarted in a sequence. Why? Simply to get zero-downtime deployments. When an instance of your application is down, the Cloud Foundry Router will NOT route packages to that instance. Simple and effective!
