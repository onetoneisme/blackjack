Application Management in Cloud Foundry
=======================================

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

Deploying the source code of this applications is really easy, but first we need to login to our Cloud Foundry foundation with the user you created previously:

```
cf api --skip-ssl-validation https://api.{{cf-get-instance-ip}}.xip.io
cf auth my-user "my-password"
```

### Pushing applications

The action of deploying an application to Cloud Foundry receives the name of **pushing**. Therefore, the command to do this is `push`.

Once you are logged in, simply use the command `cf push` to deploy the source code to Cloud Foundry, with 1 parameter only: how do you want this application to be named.

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
#0   running   [original running timestamp]   0.0%   46.8M of 256M   0 of 1G     
```

This little command will initiate a series of processes that will upload your code to Cloud Foundry, detect the language used download the corresponding [buildpack](http://docs.cloudfoundry.org/buildpacks/) and run the necessary scripts and commands to get the libraries used in the application.

If you open a browser and navigate to the URL that Cloud Foundry assigned to this application, you will see your first application running.

### Creating application manifests
