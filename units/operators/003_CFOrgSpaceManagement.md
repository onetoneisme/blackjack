# Cloud Foundry Org and Space management

### Objectives

In this lesson, you will learn about Cloud Foundry's organizational structure, RBAC system, how to manage orgs, spaces and assign permissions to users.

### ToC

1. Introduction
2. Managing Organizations
3. Managing Spaces

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

Spaces are a very convenient way of separating concerns and environments inside an Org. Managing Spaces is no different from managing Orgs.

Since we deleted the Org in the previous step, we are going to need to create a new one:

```sh
cf create-org my-org
```

#### Targeting organizations

Let's try by listing all spaces in that Org. The first step is to *target* the Org you want to get the spaces from.
This will set a default Org for the CLI to work with.

```sh
cf target -o my-org
```

Output should be:

```sh
$ cf target -o my-org
                   
API endpoint:   https://api.{{cf-get-instance-ip}}.xip.io (API version: 2.43.0)   
User:           admin   
Org:            my-org   
Space:          No space targeted, use 'cf target -s SPACE'
```

Now that the CLI knows which Org to work by default, we can do:

```sh
cf spaces
```

Which will return a list of the existing spaces in the Org:

```sh
$ cf spaces
Getting spaces in org my-org as admin...

name   
No spaces found
```

#### Creating spaces

To create an space, it is as simple as:

```sh
cf create-space my-first-space
```

The CLI will offer detailed information about the space created:

```sh
$ cf create-space my-first-space
Creating space my-first-space in org my-org as admin...
OK
Assigning role SpaceManager to user admin in org my-org / space my-first-space as admin...
OK
Assigning role SpaceDeveloper to user admin in org my-org / space my-first-space as admin...
OK

TIP: Use 'cf target -o my-org -s my-first-space' to target new space
```

> **Tip:** Notice that the CLI offers you help in many commands on what to do next, such as how to target the space you just created.
>

Now, try listing all the spaces again with the `cf spaces` command.

#### Getting info about spaces

Getting info about an space is as simple as:

```sh
cf space my-first-space
```
This will offer a good deal of info about the space we are enquiring.
Don't worry about what does that information means, we'll get to it later on.

```sh
$ cf space my-first-space
Getting info for space my-first-space in org my-org as admin...
OK

my-first-space                         
                 Org:               my-org   
                 Apps:                 
                 Domains:           {{cf-get-intance-ip}}.xip.io   
                 Services:             
                 Security Groups:   public_networks, dns, services, load_balancer, user_bosh_deployments   
                 Space Quota:          

```

#### Modifying and deleting spaces

Let's create a new space:

```sh
 $ cf create-space my-second-space
Creating space my-second-space in org my-org as admin...
OK
Assigning role SpaceManager to user admin in org my-org / space my-second-space as admin...
OK
Assigning role SpaceDeveloper to user admin in org my-org / space my-second-space as admin...
OK

TIP: Use 'cf target -o my-org -s my-second-space' to target new space
```

Now, in case we need to rename the space, its very easy to do that:

```sh
$ cf rename-space my-second-space my-trash-space
Renaming space my-second-space to my-trash-space in org my-org as admin...
OK
```

Again, you don't need to worry about changing the name, since the internal reference is maintained without alteration.

Deleting an space is really easy as well:

```sh
$ cf delete-space my-trash-space

Really delete the space my-trash-space?> yes
Deleting space my-trash-space in org my-org as admin...
OK
```

> **Tip:** you can use the `-f` modifier in some commands that ask for confirmation to force the "yes" without having to type it interactively. It is dangerous, but very useful when scripting commands. In this case, it should be `cf delete-space my-trash-space -f`
>