### Your first application

Before we can deploy anything to Cloud Foundry, we need a source code. Get it like this:

```sh
git clone https://github.com/Altoros/cf-example-sinatra
cd cf-example-sinatra
```

Deploying the source code of this applications is really easy, but first we need to login to our Cloud Foundry with admin user, or any other user that have SpaceDeveloper role in his default space:

```sh
cf api api.{{echo $CF_DOMAIN}} --skip-ssl-validation
cf auth admin "admin"
```
