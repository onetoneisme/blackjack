Deploy an application
---------------------

First, clone this GitHub repository in your work directory:

```
git clone https://github.com/Altoros/cf-example-sinatra
cd cf-example-sinatra
```

Deploying an application in CF involves using the `cf push` command. In this case, we will use the following format `cf push application-name` For example, we will use `Sinatra-Example-app`:

```
cf-app push Sinatra-Example-app
```

CF will deploy the application and will show the URL to access the application, in this case, something like `http: // sinatra-example-app.{{cf-get-instance-ip}}.xip.io/`
