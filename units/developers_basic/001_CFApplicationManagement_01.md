Application Management in Cloud Foundry
=======================================

### ToC

1.	Introduction
2.	Pushing applications
3.	Creating application manifests
4.	Pushing applications with manifests
5.	Application management

### Introduction

As part of its design, Cloud Foundry is really easy to use for developers.
Deploying applications in different programming languages is a breeze, and binding those applications to external services such as databases, message queues or 3rd party APIs is also really simple and straightforward.

## Deploying applications to Cloud Foundry

We are going to work with two different applications to demonstrate how to deploy a simple, non-packaged source code and a more complex, packaged application. The first one is written in Ruby, using the [Sinatra Framework](http://www.sinatrarb.com/) to provide a very simple web interface. The later is a Java application that uses [Spring-Boot](http://projects.spring.io/spring-boot/), consisting in two parts:

1. A simple web service that returns data on requests
2. A web interface that queries that service and shows the data to the user

It is very important that you understand how to deploy different kinds of applications, since the actual software world is comprised of services, medium services and microservices, no matter what language is used, they all interact with each other.

### The first application

Before we can deploy anything to Cloud Foundry, we need a source code.
Get it like this:

```
git clone https://github.com/eljuanchosf/cf-sinatra-example
cd cf-sinatra-example
```

Deploying the source code of this applications is really easy, but first we need to login to our Cloud Foundry foundation:
```
cf target --skip-ssl-validation https://api.{{cf-deployment-ip}}.xip.io
cf auth {{get-username}} "{{get-password}}"
```

Once you are logged in, simply use the command `cf push` to deploy the source code to Cloud Foundry, with 1 parameter only: how do you want this application to be called.
```
cf push your-app-name
```
This little command will initiate a series of processes that wil upload your code to Cloud Foundry, detect the language used in this application, download the corresponding [buildpack](http://docs.cloudfoundry.org/buildpacks/) and run the necessary scripts and commands to get the libraries used in the application.