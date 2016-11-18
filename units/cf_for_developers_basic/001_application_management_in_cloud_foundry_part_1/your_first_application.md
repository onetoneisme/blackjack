### Your first application

First, if you don't have git, you should install it using the following commands

```exec
sudo apt-get update
sudo apt-get install git -y
```

Before we can deploy anything to Cloud Foundry, we need source code. Get it by downloading the example Sinatra app, like this:

```exec
git clone https://github.com/Altoros/cf-example-sinatra
```

Deploying the source code of this application is really easy, but, first, we need to login to our Cloud Foundry PaaS:

```exec
cf api api.{{echo $CF_DOMAIN}} --skip-ssl-validation
cf auth admin "admin"
```

Next you should create new organization and space:

```exec
cf create-org my-org
cf target -o my-org
cf create-space my-space
```

And finally, you should target you organization and space using `cf target` command.

```exec
cf target -o my-org -s my-space
```

> **Tip:** If you want to list all avaliable organizations use `cf orgs` commaand. All spaces can be listed after you already target your organization with `cf target -o MY_ORG_NAME` command. You can use `cf spaces` command in order to do this.
