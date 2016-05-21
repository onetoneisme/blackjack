## Objectives

In this secton, you will learn how to implement [12-factor apps](http://12factor.net/) in Cloud Foundry, using Spring.

Also, you will get familiar with some new CF CLI commands.

To successfully complete this lesson you need Git, Java 8, Maven, and the CF CLI already installed on your machine.

Please check the following:
```sh
$ java -version
```
```sh
$ mvn --version
```
```sh
$ git --version
```
```sh
$ cf -v
```

All these commands should return valid versions. If you don't see any output when executing any of the commands, check if the corresponding tool has been already installed and make sure is in the `PATH` variable.

If everything is OK, you need to connect your CF client to a working environment. To do it, execute the following on your local machine:

```sh
$ cf api --skip-ssl-validation http://api.{{echo $CF_DOMAIN}}
```
```sh
$ cf login
```

And enter `admin` and `admin` as credentials. If the login was successful, you should see output similar to this:

```sh
OK

Targeted org default_organization



API endpoint:   http://api.{{echo $CF_DOMAIN}} (API version: 2.44.0)
User:           admin
Org:            default_organization
Space:          No space targeted, use 'cf target -s SPACE'
```

Now, create a development space in CF:

```sh
$ cf create-space development
```

and then make it your target space:

```sh
$ cf target -s development
```
