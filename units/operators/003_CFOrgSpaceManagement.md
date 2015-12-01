# Cloud Foundry Org and Space management

### Objectives

In this lesson, you will learn about Cloud Foundry's organizational structure, RBAC system, how to manage orgs, spaces and assign permissions to users.

### ToC

1. Introduction
2. Managing Organizations
3. Managing Spaces
4. Assigning permissions to users

### Introduction

Cloud Foundry provides, out of the box, a powerful Role Based Access Control (RBAC) system that will help you organize, secure and provide flexible configurations for deploying applications and services.

To understand a little bit more about Orgs, Spaces and Roles, the [official documentation](https://docs.cloudfoundry.org/concepts/roles.html) has a very good introduction.

At an overview, the structure can be defined as:

**TODO**: Make a pretty graphic.

```
Organization(s)
|
--- Space(s)
    |
    --- User(s) < (permissions/roles)
        |
        --- Application(s)
```

In short, Cloud Foundry has one or many organizations, which in turn have one or many spaces that have one or many users that have permissions, and the users deploy or target applications in the spaces assigned.

This simple, yet flexible organizational structure will allow you to adapt Cloud Foundry to your company needs.

### Managing Organizations

To manage organizations, spaces and assign permissions, you have to be logged in as an *admin* user, or a user with admin permissions.

To do this, you can use the `cf auth` command as we used it in the previous lesson (Quick Start).

Once you are logged in, lets find out your top-level organizational structure:

```sh
cf orgs
```

This command will show you a list of organizations that you might have created previously.

#### Create organizations

Now, to add an organization, simpy do:

```sh
cf create-org my-org
```

You will see something like:

```sh
$ cf create-org my-org
Creating org my-org as admin...
OK

TIP: Use 'cf target -o my-org' to target new org
```

Now, try again listing the existing organizations with `cf orgs`
Your new organization should be listed there.

#### Getting info about an organization

A very good way to get information about the organization you just created is by using the `cf org` command:

```
cf org my-org
```

The result will be something like:

```sh
$ cf org my-org
Getting info for org my-org as admin...
OK

my-org:                      
          domains:        {{cf-get-instance-ip}}.xip.io   
          quota:          default (10240M memory limit, Unlimited instance memory limit, 1000 routes, 100 services, paid services allowed)   
          spaces:            
          space quotas:      

```

>**Tip:** note the *singular* vs. the *plural* noun used in `cf orgs`. Using the plural will get you a list of the objects represented by the noun, and the singular version will do something else, usually get details. This is a very common pattern in Cloud Foundry's CLI.
>

#### Modifying and deleting organizations

One situation that might happen, is that you need to rename one of the Orgs you created. Do not worry about this situation, since Cloud Foundry maintains an internal reference for the Org, decoupling the name from the internal structure:

```sh
cf rename-org my-org my-renamed-org
```

Output should be:

```sh
$ cf rename-org my-org my-renamed-org
Renaming org my-org to my-renamed-org as admin...
OK
```

Also, at some point is probable that we are going to need to delete an organization.

```sh
cf delete-org my-renamed-org
```

The CLI is going to ask for confirmation and then effectively erase the org:

```sh
$ cf delete-org my-renamed-org

Really delete the org my-renamed-org and everything associated with it?> yes
Deleting org my-renamed-org as admin...
OK
```
>**Warning:** Deleting an Org means that Cloud Foundry will delete ALL objects and applications depending of that Org. It is a very destructive procedure, so be very carefull with it.
>

### Managing spaces



