### Binding and unbinding services

So, how do you use the service you have just created in your application?
To do this, you need to *bind* your service to your application.
Binding will allow your app to get the necessary information to use the service. This includes the connection URI, username, password, connection parameters, etc.

```exec
cf bind-service my-app my-app-db
```

Now, let's try it in our application.

First, you need to have some code in place to use the service.
Go to the `cf-example-sinatra` application that you have cloned before, and do:

```exec
cd ~/cf-example-sinatra
git checkout with-service
```

Now, use your favorite text editor to open the `app.rb` file. If you are not comfortable using console editor you can use File Browser included on the page. In order to edit files using the File Browser, right click on the file and select 'Edit content' option.

You will notice this chunk of code:

```ruby
vcap_services = JSON.parse(ENV['VCAP_SERVICES'])
db_user = vcap_services['p-mysql'].first['credentials']['username']
db_password = vcap_services['p-mysql'].first['credentials']['password']
db_host = vcap_services['p-mysql'].first['credentials']['hostname']
@db_name = vcap_services['p-mysql'].first['credentials']['name']
```

This is where all the magic is hidden.
The first line will parse the JSON object that Cloud Foundry injects into the `VCAP_SERVICES` environment variable.
The following lines will access the properties of that JSON object to get the necessary information to connect to the database and retrieve some data.

Now, push your app with `cf push my-app`.

If you go to the URL provided by Cloud Foundry, you will see some information extracted from MySQL's *information schema*.

That's it!

Of course, there is the `unbind-service` command, which will detach a service instance from an application. Do **NOT** unbind the service right now, you will do it later.

```
cf unbind-service my-app my-sinatra-app-db
```
