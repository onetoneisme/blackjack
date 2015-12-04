# Cloud Foundry Main Concepts

## Objective

In this lesson you will learn what is Cloud Foundry, why it matters and basic concepts about it's architecture and inner workings.

Then you will move to install Cloud Foundry's CLI tool as well as some basic configuration for it and how to get help from the CLI.

### ToC

1. What is Cloud Foundry?
2. Why is Cloud Foundry a major player in the PaaS world?
3. Cloud Foundry architecture
4. Cloud Foundry's CLI installation
5. Getting help

### What is Cloud Foundry?

[Cloud Foundry](https://www.cloudfoundry.org/) is a PaaS, a Platform as a Service. This means that we can define Cloud Foundry as a series of components that are deployed in an Infrastructure as a Service (such as Amazon's AWS, OpenStack, vCloud, vSphere) that will allow developers to deploy applications extremely fast without worrying about the underlying infrastructure, and will allow DevOps to provide a secure, predictable, resilient and flexible platform to be used by the stakeholders.

### Why is Cloud Foundry a major player in the PaaS world?

Cloud Foundry is probably the most deployed, tested and well known open source PaaS that can be privately deployed.
First, it's development is guided by the [Cloud Foundry foundation](https://www.cloudfoundry.org/foundation/), which ensures that all development efforts, product releases, communities and events are done by and for all of the Foundation's members.
Second, market leaders like EMC, VMWare, Pivotal, IBM, Intel, SAP and HP are helping build Cloud Foundry by contributing in many ways.
Third, Cloud Foundry's list of users is impressive: EMC, Pivotal, IBM, SAP, HP, Intel, Hospira, Huawai, Baidu, GE Aviation, AllState are some of the companies using Cloud Foundry in production, with more joining this exciting community every day.

If you want to read some inspiring quotes about CF and it's community, here are three links that will really inspire you.

* [CF Summit 2014 quotes](http://blog.altoros.com/top-quotes-from-the-cloud-foundry-summit-2014.html)
* [CF Summit 2015 quotes](http://blog.altoros.com/top-qoutes-from-the-cloud-foundry-summit-2015.html)
* [CF Summit Berlin 2015 quotes](http://www.altoros.com/cflive/top-quotes-from-cloud-foundry-summit-berlin-2015/)


### Cloud Foundry's architecture

A very good read on Cloud Foundry's architecture and components can be found [here](http://docs.cloudfoundry.org/concepts/architecture/). We strongly suggest that you read that document before proceeding to the next step.

### Cloud Foundry's CLI installation

Since Cloud Foundry works in a server-side deployment, you will need a way to communicate with the foundation (a Cloud Foundry foundation is a whole Cloud Foundry deployment) and perform day to day operations.
The community developed a very convenient CLI tool that allows performing most of the operations required to operate CF.

As we are using an Ubuntu jumpbox, you are going to download and install the Debian-based package, but it is important for you to know that the CLI is available for [other operating systems](https://github.com/cloudfoundry/cli#downloads) as well.

To download the .deb package, use cURL:

```sh
curl -o cf_cli.deb -J -L 'https://cli.run.pivotal.io/stable?release=debian64&source=github'
```

This will download the latest CLI version for Debian 64 bits distributions.

To install it, simply run:

```sh
sudo dpkg -i cf_cli.deb
```

Try it by simply typing `cf --version`.

You should see something like:

```sh
$ cf --version
cf version 6.14.0+2654a47-2015-11-18
```

Be aware that the version number can vary.

### Getting help

Cloud Foundry's CLI has a very good inline help.
Try executing the `cf` command without options. You will get a lot of commands and options with their descriptions.
This is fundamental to know, as it will help a lot to navigate through CF's CLI commands.
As an example, let's say that you want to view all the commands related to `spaces`. It is possible to tunnel the CLI help through Linux's `grep` command:

```sh
cf | grep space
```

Now, suppose you want to get specific help on how to create a space with `create-space`.
Simply use the `help` command and specify which action do you want help with:

```sh
cf help create-space
```

This will show you something like:

```sh
$ cf help create-space
NAME:
   create-space - Create a space

USAGE:
   cf create-space SPACE [-o ORG] [-q SPACE-QUOTA]

OPTIONS:
   -o       Organization
   -q       Quota to assign to the newly created space (excluding this option results in assignment of default quota)

```

It is very easy to get help with Cloud Foundry's CLI and perform operations on your Cloud Foundry foundation.
