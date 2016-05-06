Deploy an application
---------------------

First, if you don't have git installed, install it with the following command:

```
sudo apt-get update
sudo apt-get install git -y
```

Then, clone this GitHub repository in your work directory:

```sh
git clone https://github.com/Altoros/cf-example-sinatra
cd cf-example-sinatra
```

Deploying an application in CF involves using the `cf push` command. In this case, we will use the following format `cf push application-name`. For example, we will use `Sinatra-Example-app`:

```sh
cf push Sinatra-Example-app
```

CF will deploy the application and display its URL, in this case, something like `http://sinatra-example-app.{{echo $CF_DOMAIN}}/`
