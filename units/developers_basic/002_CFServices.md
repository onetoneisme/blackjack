Cloud Foundry Services
======================

### ToC

1.  Introduction
2.  Listing, creating, deleting, updating services and service keys
3.  Binding and unbinding services
4.  User provided services

### Introduction

Ok, now we have an application deployed, and two instances of that application running side by side, load balanced by the Cloud Foundry Router.
However, how do I see what is going on with the application?
How do I see the logs?
The Cloud Foundry CLI provides a couple of commands to satisfy these needs.

### Viewing events

An *event* is something that happens to your application at deployment level. Is different from an internal application log. All actions suffered by the application are recorded and can later be audited:

```
cf events my-app
```

Output should be similar to:

```
$ cf events my-app
Getting events for app my-app in org my-org / space my-first-space as my-user...

time                          event                 actor     description
2015-12-23T14:24:02.00-0300   audit.app.update      my-user   environment_json: PRIVATE DATA HIDDEN
2015-12-23T14:23:29.00-0300   audit.app.update      my-user   environment_json: PRIVATE DATA HIDDEN
2015-12-23T14:19:28.00-0300   audit.app.update      my-user   environment_json: PRIVATE DATA HIDDEN
2015-12-23T13:41:23.00-0300   app.crash             my-app    index: 1, reason: CRASHED, exit_description: failed to start, exit_status: -1
2015-12-23T13:41:18.00-0300   audit.app.update      my-user   state: STARTED
2015-12-23T13:41:16.00-0300   audit.app.update      my-user   state: STOPPED
2015-12-23T13:41:16.00-0300   audit.app.update      my-user   memory: 64
2015-12-23T13:37:37.00-0300   audit.app.update      my-user   instances: 2
2015-12-23T13:33:03.00-0300   audit.app.update      my-user   state: STARTED
2015-12-23T13:32:58.00-0300   audit.app.update      my-user   state: STOPPED
2015-12-23T13:32:56.00-0300   audit.app.update      my-user   memory: 512
2015-12-23T13:28:00.00-0300   audit.app.update      my-user   state: STARTED
2015-12-23T13:27:54.00-0300   audit.app.update      my-user
2015-12-23T13:27:54.00-0300   audit.app.map-route   my-user
2015-12-23T13:27:49.00-0300   audit.app.create      my-user   instances: 1, state: STOPPED, environment_json: PRIVATE DATA HIDDEN
```

As you can see, these events are related to all the operations done by Cloud Foundry instead of what is going on INSIDE the application.

### Viewing logs

Logs are very easy to view:

```
cf logs my-app
```

While you are tailing the logs with the previous command, go to your browser and navigate to [your app](http://my-app.{{cf-get-instance-ip}}.xip.io/) and reload the page a couple of times.

Output should similar to:

```
$ cf logs my-app
Connected, tailing logs for app my-app in org my-org / space my-first-space as my-user...

2015-12-23T15:06:29.12-0300 [App/0]      ERR 181.29.164.209, 10.244.0.21 - - [23/Dec/2015 18:06:29] "GET / HTTP/1.1" 200 906 0.0246
2015-12-23T15:06:29.13-0300 [RTR/0]      OUT my-app.{{cf-get-instance-ip}}.xip.io - [23/12/2015:18:06:29 +0000] "GET / HTTP/1.1" 200 0 906 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36" 10.244.0.21:50393 x_forwarded_for:"181.29.164.209, 10.244.0.21" x_forwarded_proto:"http" vcap_request_id:83ed06f6-a183-43bf-4459-356c34108c83 response_time:0.101611411 app_id:6d6911ed-ec44-40ca-92fa-14d14798686b
2015-12-23T15:06:29.36-0300 [App/1]      ERR 181.29.164.209, 10.244.0.21 - - [23/Dec/2015 18:06:29] "GET /style.css HTTP/1.1" 200 857 0.0043
2015-12-23T15:06:29.37-0300 [RTR/0]      OUT my-app.{{cf-get-instance-ip}}.xip.io - [23/12/2015:18:06:29 +0000] "GET /style.css HTTP/1.1" 200 0 857 "http://my-app.{{cf-get-instance-ip}}.xip.io/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36" 10.244.0.21:50393 x_forwarded_for:"181.29.164.209, 10.244.0.21" x_forwarded_proto:"http" vcap_request_id:fb6c3f03-6473-4894-74e4-345bd5842ea5 response_time:0.016813959 app_id:6d6911ed-ec44-40ca-92fa-14d14798686b
2015-12-23T15:06:33.07-0300 [App/0]      ERR 181.29.164.209, 10.244.0.21 - - [23/Dec/2015 18:06:33] "GET /favicon.ico HTTP/1.1" 404 18 0.0004
2015-12-23T15:06:33.07-0300 [RTR/0]      OUT my-app.{{cf-get-instance-ip}}.xip.io - [23/12/2015:18:06:33 +0000] "GET /favicon.ico HTTP/1.1" 404 0 18 "http://my-app.{{cf-get-instance-ip}}.xip.io/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36" 10.244.0.21:50393 x_forwarded_for:"181.29.164.209, 10.244.0.21" x_forwarded_proto:"http" vcap_request_id:806c5b61-3f99-4577-50a9-5bde5f499395 response_time:0.004557008 app_id:6d6911ed-ec44-40ca-92fa-14d14798686b
```
> **Notice**: Don't worry about the ERR messages. We'll fix that later as part of the course.

You can also dump the logs to a file instead of tailing, using the `--recent` flag.

```
cf logs my-app --recent > my-logs.txt
```

### Application files

Cloud Foundry's CLI also provides a way to view the files in each instance of your deployed applications, as well as the content of a file.

To view the files of an application, simply do:

```
cf files my-app
```

Output should be similar to:

```
$ cf files my-app
Getting files for app my-app in org my-org / space my-first-space as my-user...
OK

.bash_logout                              220B
.bashrc                                   3.6K
.profile                                  675B
app/                                         -
logs/                                        -
run.pid                                     3B
staging_info.yml                          334B
tmp/                                         -
```

As you can see, you are in the root of the application deployment directory structure. If you want to go inside of one of the directories, specify it in the command line:

```
cf files my-app app/
```

Or

```
cf files my-app app/public
```

Viewing the content of a file is as easy as getting the files in a directory:

```
cf files my-app app/README.md
```

Also, it is possible to run the `cf files` command for an specific instance:

```
cf files my-app -i 1
```

That command will show the files for the 2nd instance of `my-app`.
> **Tip**: Remember that instances start at index 0.
