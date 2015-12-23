Application Management in Cloud Foundry - Part 1
================================================

### ToC

1.	Introduction
2.	Your first application
3.	Pushing applications
4.	Creating application manifests
5.	Pushing applications with manifests
6.	Application management

### Introduction

As part of its design, Cloud Foundry is really easy to use for developers. Deploying applications in different programming languages is a breeze, and binding those applications to external services such as databases, message queues or 3rd party APIs is also really simple and straightforward.

Deploying applications to Cloud Foundry
---------------------------------------

We are going to work with two different applications to demonstrate how to deploy a simple, non-packaged source code and a more complex, packaged application. The first one is written in Ruby, using the [Sinatra Framework](http://www.sinatrarb.com/) to provide a very simple web interface. The later is a Java application that uses [Spring-Boot](http://projects.spring.io/spring-boot/), consisting in two parts:

1.	A simple web service that returns data on requests
2.	A web interface that queries that service and shows the data to the user

It is very important that you understand how to deploy different kinds of applications, since the actual software world is comprised of services, medium services and microservices, no matter what language is used, they all interact with each other.

### Your first application

Before we can deploy anything to Cloud Foundry, we need a source code. Get it like this:

```
git clone https://github.com/Altoros/cf-example-sinatra
cd cf-example-sinatra
```

Deploying the source code of this applications is really easy, but first we need to login to our Cloud Foundry foundation with the user you created previously, and target your Org and Space:

```
cf api --skip-ssl-validation https://api.{{cf-get-instance-ip}}.xip.io
cf auth my-user "my-password"
cf target -o my-org -s my-first-space
```

### Pushing applications

The action of deploying an application to Cloud Foundry receives the name of **pushing**. Therefore, the command to do this is `push`.

Once you are logged in, simply use the command `cf push` to deploy the source code to Cloud Foundry, with 1 parameter only: how do you want this application to be named.

But first, we need to expand the memory limit of the space quota we created in the previous units.

```
cf update-space-quota small-space-quota -i 2G
```
> **Tip**: You will need to login as the *admin* user, target the containing Org and then update the size of the quota. Then, you will need to login back again as *my-user*. Also, while you are logged in as *admin*, you could delete the *training* Org.

Once the space quota is updated, you can deploy your application.

```
cf push my-sinatra-example
```

Output should be:

```
Creating app my-sinatra-app in org my-org / space my-first-space as my-user...
OK

Creating route my-sinatra-app.{{cf-get-instance-ip}}.xip.io...
OK

Binding my-sinatra-app.{{cf-get-instance-ip}}.xip.io to my-sinatra-app...
OK

Uploading my-sinatra-app...
.
. [lots of output]
.
requested state: started
instances: 1/1
usage: 256M x 1 instances
urls: my-sinatra-app.{{cf-get-instance-ip}}xip.io
last uploaded: [push timestamp]

     state     since                    cpu    memory          disk      details
#0   running   [original timestamp]     0.0%   46.8M of 256M   0 of 1G
```

This little command will initiate a series of processes that will upload your code to Cloud Foundry, detect the language used download the corresponding [buildpack](http://docs.cloudfoundry.org/buildpacks/) (we will go deep into buildpacks further on) and run the necessary scripts and commands to get the libraries used in the application.

If you open a browser and navigate to the URL that Cloud Foundry assigned to this application, you will see your first application running.

#### Controlling resources when pushing

As you can see, pushing the application uses some default values such as the disk size and memory limits. To specify custom values, the CLI offers a series of modifiers:

```
cf push my-sinatra-app -k 128M -m 256M
```

This command will push your application again, but this time setting a disk size (`-k`) of 128M and a memory limit (`-m`) of 256M. You can get help on all the modifiers available to the `push` command by doing executing `cf help push`.

```
$ cf help push
NAME:
   push - Push a new app or sync changes to an existing app

ALIAS:
   p

USAGE:
   Push a single app (with or without a manifest):
   cf push APP_NAME [-b BUILDPACK_NAME] [-c COMMAND] [-d DOMAIN] [-f MANIFEST_PATH]
   [-i NUM_INSTANCES] [-k DISK] [-m MEMORY] [-n HOST] [-p PATH] [-s STACK] [-t TIMEOUT]
   [--no-hostname] [--no-manifest] [--no-route] [--no-start]

   Push multiple apps with a manifest:
   cf push [-f MANIFEST_PATH]


OPTIONS:
   -b                   Custom buildpack by name (e.g. my-buildpack) or GIT URL (e.g. 'https://github.com/heroku/heroku-buildpack-play.git') or GIT BRANCH URL (e.g. 'https://github.com/heroku/heroku-buildpack-play.git#develop' for 'develop' branch)
   -c                   Startup command, set to null to reset to default start command
   -d                   Domain (e.g. example.com)
   -f                   Path to manifest
   -i                   Number of instances
   -k                   Disk limit (e.g. 256M, 1024M, 1G)
   -m                   Memory limit (e.g. 256M, 1024M, 1G)
   -n                   Hostname (e.g. my-subdomain)
   -p                   Path to app directory or file
   -s                   Stack to use (a stack is a pre-built file system, including an operating system, that can run apps)
   -t                   Maximum time (in seconds) for CLI to wait for application start, other server side timeouts may apply
   --no-hostname        Map the root domain to this app
   --no-manifest        Ignore manifest file
   --no-route           Do not map a route to this app and remove routes from previous pushes of this app.
   --no-start           Do not start an app after pushing
   --random-route       Create a random route for this app
```

### Creating application manifests

Although pushing your source code to Cloud Foundry is really simple, you will probably need some place to specify and save all the parameters you customized when deploying your application. As you can see in the help that the `push` command offers, there is something called a *manifest*. A manifest is a [YAML](http://yaml.org/) usually residing in the root directory of your source code. If you name it `manifest.yml` or `manifest.yaml`, the CLI will pick it automatically without having to specify its location.

Now, create a manifest template by using the following command:

```
cf create-app-manifest my-sinatra-app
```

Output should be:

```
$ cf create-app-manifest my-sinatra-app
Creating an app manifest from current settings of app my-sinatra-app ...

OK
Manifest file created successfully at ./my-sinatra-app_manifest.yml
```

The CLI just created a `my-sinatra-app_manifest.yml` file with this content:

```yaml
---
applications:
- name: my-sinatra-app
  memory: 256M
  instances: 1
  host: my-sinatra-app
  domain: {{cf-get-instance-ip}}.xip.io
```

### Creating application manifests

Now, let's reduce the instance memory again, since our application is very small and can run without any issue with 128M. With your favorite text editor, open the file and change the `memory:` value to `128M`. Save it and push the application again, this time specifying the manifest file:

```
cf push -f my-sinatra-app_manifest.yml
```

Output should be:

```
$ cf push -f my-sinatra-app_manifest.yml
Using manifest file my-sinatra-app_manifest.yml

Updating app my-sinatra-app in org my-org / space my-first-space as my-user...
OK

Using route my-sinatra-app.{{cf-get-instance-ip}}.xip.io
Uploading my-sinatra-app...
.
. [lots of output]
.
requested state: started
instances: 1/1
usage: 128M x 1 instances
urls: my-sinatra-app.{{cf-get-instance-ip}}.xip.io
last uploaded: [output timestamp]

     state     since                    cpu    memory          disk        details
#0   running   [output timestamp]       0.0%   46.4M of 128M   0 of 128M
```

As you can see, is much more convenient for you to use an application manifest. One more trick for make the code pushing even more easy: rename the `my-sinatra-app_manifest.yml` file to `manifest.yml`.

Then, if you do `cf push`, with no parameter at all, the CLI will pick the `manifest.yml` file automatically.

Go ahead and try it!

### Application management

Cloud Foundry's CLI provides a myriad of options to manage your applications.

#### Listing applications

In the same way that Orgs, Users and Spaces can be listed, there is an option to list our deployed apps:

```
cf apps
```

You will see your application listed there.

> **Tip:** `cf apps` will only list applications that were pushed into the *target* (the Org and Space we sat before). If you want to list applications in another org/space, you need to set the target again with the `cf target` command.

Also, getting detailed information about the application is as easy as:

```
cf app my-sinatra-app
```

#### Modifying applications

One of the possible scenarios you may run into is that you will need to rename your application. Again, this is VERY simple:

```
cf rename my-sinatra-app my-app
```

Output should be:

```
$ cf rename my-sinatra-app my-app
Renaming app my-sinatra-app to my-app in org my-org / space my-first-space as my-user...
OK
```

Now, if you get the information with `cf app my-app` you will find that the application has been renamed. This, however, will not update your `manifest.yml` or the route (URL) to access your app. What Cloud Foundry has done is to modify the internal name so you can use that name for your CLIs commands.

Now, another command you will find useful is the `delete` command. This action will effectively delete an application from Cloud Foundry.

```
cf delete my-app
```

Output should be:

```
$ cf delete my-app

Really delete the app my-app?> yes
Deleting app my-app in org my-org / space my-first-space as my-user...
OK
```

> **Tip:** you can always skip confirmation by using the -f flag: `cf delete my-app -f`

Try now deleting the `my-sinatra-example` application, forcing the confirmation:

```
cf delete my-sinatra-example -f
```
