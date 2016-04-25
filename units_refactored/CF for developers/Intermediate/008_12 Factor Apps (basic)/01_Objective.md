## Objective

In this lesson you will learn how to implement 12 Factors(http://12factor.net/) in Cloud Foundry using Spring.
Also, you will take a look at some new CF cli commands.

To successfully complete this lesson you need Git, Java 8, Maven, and the CF cli already installed on your machine.

Please check
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

All these commands should return correct version. If you don't see any input executing some command, check if corresponding tool has been already installed and it is in PATH variable.
If all is OK you need to connect your CF client to work environment. To do it execute the next command on your local machine:
```sh
$ cf api --skip-ssl-validation http://api.{{echo $CF_DOMAIN}}
```
```sh
$ cf login
```
And enter **admin** and **admin** as credentials. If all is OK you should see similar output:
```sh
OK

Targeted org default_organization



API endpoint:   http://api.{{echo $CF_DOMAIN}} (API version: 2.44.0)
User:           admin
Org:            default_organization
Space:          No space targeted, use 'cf target -s SPACE'
```

Now create development space in CF
```sh
$ cf create-space development
```
and make it your target space
```sh
$ cf target -s development
```
