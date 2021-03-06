### Your first application

First, if you don't have git, you should install it using the following commands

```sh
sudo apt-get update
sudo apt-get install git -y
```

Before we can deploy anything to Cloud Foundry, we need source code. Get it by downloading the example Sinatra app, like this:

```sh
git clone https://github.com/Altoros/cf-example-sinatra
cd cf-example-sinatra
```

Deploying the source code of this application is really easy, but, first, we need to login to our Cloud Foundry PaaS with the user you created previously and then target your org and space:

```sh
cf api api.{{echo $CF_DOMAIN}} --skip-ssl-validation
cf auth admin "admin"
```

And finally, you should target you organization and space using `cf target` command.

> **Tip:** If you want to list all avaliable organizations use `cf orgs` commaand. All spaces can be listed after you already target your organization with `cf target -o MY_ORG_NAME` command. You can use `cf spaces` command in order to do this.
