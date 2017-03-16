### Introduction

[BOSH](http://bosh.io/docs/about.html) is a project that unifies release engineering, deployment, and lifecycle management of small and large-scale cloud software. BOSH can provision and deploy software over numerous VMs. It also performs monitoring, failure recovery, and software updates with zero-to-minimal downtime.

While BOSH was developed to deploy [Cloud Foundry](https://www.cloudfoundry.org/), it can also be used to deploy almost any other software (e.g. services). In  this course, we will use BOSH for installing and configuring Cloud Foundry deployment as well as other important components. But the first thing we are going to do is to install BOSH itself.

### The Main BOSH Concepts

BOSH has several concepts that are important to understand. You can say that the main BOSH job is spin up new VM, configure and manage them. These VMs in terms of BOSH are called `Instances`. Such `Instances` are grouped in `Instance Groups` which contain the same packages and configuration. 

There are three things that you need to prepare as an input to BOSH to deploy anything:

- `Stemcell` - basic operating system image, which.
- `Release` - that is basically packages with source code or binaries of software that will be run on `Instances`.
- `Manifest` - the main configuration file that provides BOSH with information on instances that need to be spin up.

You can think of stemcell as an operating system, about release as a package and about manifes as main configuration file. The diagram below shows relations between these terms:

![](https://s3.amazonaws.com/cf-training-resources/inputs.png)

BOSH as an another complex tool has its own terminology, we recomend to get acquainted with the necessary vocabulary in [BOSH docs](http://bosh.io/docs/terminology.html).
