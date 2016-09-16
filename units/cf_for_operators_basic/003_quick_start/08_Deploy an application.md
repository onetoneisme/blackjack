Deploy an application
---------------------

First, if you don't have Git installed, install it with the following command:

```
sudo apt-get update
sudo apt-get install git -y
```

Then, clone this GitHub repository into your work directory:

```sh
git clone https://github.com/Altoros/cf-example-sinatra
cd cf-example-sinatra
```

Deploying an application in CF involves using the `cf push` command. In this case, we will use the following format: `cf push application-name`. For example, if we use `Sinatra-Example-app`, the command will be:

```sh
cf push Sinatra-Example-app
```

CF will deploy the application and display its URL, in this case, it will be something like `http://sinatra-example-app.{{echo $CF_DOMAIN}}/`.
