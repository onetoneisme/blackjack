### Your first application

Before we can deploy anything to Cloud Foundry, we need source code. Get it by downloading the example Sinatra app, like this:

```sh
git clone https://github.com/Altoros/cf-example-sinatra
cd cf-example-sinatra
```

Deploying the source code of this application is really easy, but, first, we need to login to our Cloud Foundry PaaS with the user you created previously and then target your Org and Space:

```sh
cf api api.{{echo $CF_DOMAIN}} --skip-ssl-validation
cf auth my-user "my-password"
cf target -o my-org -s my-space
```
