### Your first application

Before we can deploy anything to Cloud Foundry, we need a source code. Get it like this:

```
git clone https://github.com/Altoros/cf-example-sinatra
cd cf-example-sinatra
```

Deploying the source code of this applications is really easy, but first we need to login to our Cloud Foundry foundation with the user you created previously, and target your Org and Space:

```
cf api api.{{echo $CF_DOMAIN}}
cf auth my-user "my-password"
cf target -o my-org -s my-space
```
