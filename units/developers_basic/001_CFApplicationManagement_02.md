Application Management in Cloud Foundry - Part 2
================================================

### ToC

1.	Introduction
2.	Restarting applications
3.	Restaging applications
4.	Scaling up and down
5.	Restarting an instance
6.	Environmental variables

### Introduction

Since we deleted the application, let's deploy it again. But first, edit the `manifest.yml` file and change **only** the `name` attribute value to `my-app`. Save the file and push the application:

```
cf push
```

Now that we have an application running again! Yes, *that* easy.

### Restarting applications

There are several ways of restarting an application, each one with some differences that makes them very useful.

Try:

```
cf stop my-app
```

Output should be:

```
$ cf stop my-app
Stopping app my-app in org my-org / space my-first-space as my-user...
OK
```

Check that the application is halted successfully with `cf app my-app`. This will simply stop the application, leaving all the source code there, ready to be started again:

```
cf start my-app
```

Output will show that the application has been started again.

Those two steps can be summed combined:

```
cf restart my-app
```

### Restaging applications

There is another way to "restart" an application, which is called *restaging*. Restaging an application means that, except uploading the application code, all the processes that are executed when pushing an application will run again. See what happens when you run `cf restage`:

```
cf restage my-app
```

As you can see, there is fundamental difference with restarting applications: a simple `restart` will keep the droplet, whilst `restage` will erase the current droplet and create a new one with the code previously pushed.

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

### Restarting an instance

Sometimes it happens and an instance gets interrupted in it's normal behaviour by some reason.
To restart it and have it working again, you can use the `cf restart-app-instance` command.

Let's say that the instance number **2** of your application stopped somehow. Restart it by doing:

```
cf restart-app-instance my-app 2
```

Output should be:

```
$ cf restart-app-instance my-app 2
Restarting instance 2 of application my-app as my-user
OK
```

### Environmental variables

Following the principles of the **12 factor app** (don't worry, we'll talk about this soon), Cloud Foundry implements a series of enviromental variables that allows you, as a developer, to read them and use them. Please read the following article before moving forward: [Cloud Foundry Environment Variables](https://docs.cloudfoundry.org/devguide/deploy-apps/environment-variable.html).

#### Viewing variables

To view the available environmental variables available for your application, use:

```
cf env my-app
```

Output should be similart to:

```
$ cf env my-app
Getting env variables for app my-app in org my-org / space my-first-space as my-user...
OK

System-Provided:


{
 "VCAP_APPLICATION": {
  "application_id": "6d6911ed-ec44-40ca-92fa-14d14798686b",
  "application_name": "my-app",
  "application_uris": [
   "my-app.{{cf-get-instance-ip}}.xip.io"
  ],
  "application_version": "a372ae9a-c3ec-4201-a1bb-30ea45b0ad26",
  "limits": {
   "disk": 1024,
   "fds": 16384,
   "mem": 64
  },
  "name": "my-app",
  "space_id": "67622917-e943-47fb-8c06-f12ae5694327",
  "space_name": "my-first-space",
  "uris": [
   "my-app.{{cf-get-instance-ip}}.xip.io"
  ],
  "users": null,
  "version": "a372ae9a-c3ec-4201-a1bb-30ea45b0ad26"
 }
}

No user-defined env variables have been set

No running env variables have been set

No staging env variables have been set
```

#### Setting a variable

Suposse that you need to set a variable to provide a value to your application. Just do:

```
cf set-env my-app MYVAR myvalue
```

Output should be:

```
$ cf set-env my-app MYVAR myvalue
Setting env variable 'MYVAR' to 'myvalue' for app my-app in org my-org / space my-first-space as my-user...
OK
TIP: Use 'cf restage' to ensure your env variable changes take effect
```

Although this variable will be imeediately availabe to all you application instances, if you want your application to start reading the variable you should **restage** it. However, since it is not necessary, you can skip that step.

If you run again `cf env my-app`, you will see that `MYVAR` and it's value appears under the `User-Provided` section.
Now, define a second variable:

```
cf set-env my-app MY_OTHER_VAR myothervalue
```

Check again the variables. To unset (remove) a variable from the environment, you simply do:

```
cf unset-env my-app MY_OTHER_VAR
```

Output should be:

```
$ cf unset-env my-app MY_OTHER_VAR
Removing env variable MY_OTHER_VAR from app my-app in org my-org / space my-first-space as my-user...
OK
TIP: Use 'cf restage' to ensure your env variable changes take effect
```

Easy as it seems, it is very powerful.
Also, you can set all of this variables in the application manifest, as we will see later on.
