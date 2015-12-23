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

Since we have deleted the application, lets deploy it again. But before, edit the `manifest.yml` file and change **only** the `name` attribute value to `my-app`. Save the file and push the application:

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

Scaling up and down
