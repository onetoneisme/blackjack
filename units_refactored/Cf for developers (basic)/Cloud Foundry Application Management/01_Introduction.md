### Introduction

As part of its design, Cloud Foundry is really easy to use for developers. Deploying applications in different programming languages is a breeze, and binding those applications to external services such as databases, message queues or 3rd party APIs is also really simple and straightforward.

Deploying applications to Cloud Foundry
---------------------------------------

We are going to work with two different applications to demonstrate how to deploy a simple, non-packaged source code and a more complex, packaged application. The first one is written in Ruby, using the [Sinatra Framework](http://www.sinatrarb.com/) to provide a very simple web interface. The later is a Java application that uses [Spring-Boot](http://projects.spring.io/spring-boot/), consisting in two parts:

1.	A simple web service that returns data on requests
2.	A web interface that queries that service and shows the data to the user

It is very important that you understand how to deploy different kinds of applications, since the actual software world is comprised of services, medium services and microservices, no matter what language is used, they all interact with each other.
