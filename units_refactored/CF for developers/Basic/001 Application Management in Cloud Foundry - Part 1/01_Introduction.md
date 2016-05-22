### Introduction

As part of its design, Cloud Foundry is really easy to use for developers. Deploying applications in different programming languages is a breeze, and binding those applications to external services, such as databases, message queues, or third-party APIs, is also really simple and straightforward.

Deploying applications to Cloud Foundry
---------------------------------------

We are going to work with two different applications to demonstrate how to deploy source code to your Cloud Foundry PaaS. Both of them are written in Ruby, using the [Sinatra framework](http://www.sinatrarb.com/) and [Ruby on Rails](http://www.rubyonrails.org). We chose Ruby for this course, because its syntax is easily translatable to other programming languages.

It is very important that you understand how to deploy different kinds of applications, since the actual software world is comprised of services, medium-size services, and microservices. No matter what language is used, they all interact with each other.
