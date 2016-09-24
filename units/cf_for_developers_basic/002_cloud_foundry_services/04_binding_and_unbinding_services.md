### Binding and unbinding services

So, how do you use the service you have just created in your application?
To do this, you need to *bind* your service to your application.
Binding will allow your app to get the necessary information to use the service. This includes the connection URI, username, password, connection parameters, etc.

```sh
cf bind-service my-app my-app-db
```

The output should be:

```
$ cf bind-service my-app my-app-db
Binding service my-app-db to app my-app in org my-org / space my-first-space as my-user...
OK
TIP: Use 'cf restage' to ensure your env variable changes take effect
```

Cloud Foundry will inject, via environment variables, all the information required to use the service you just bound. Use the `cf env` command to view this information. You will get something like:

```
 "VCAP_SERVICES": {
   "p-mysql": [                                                                                                                                                                                              [0/250]
      {
       "credentials": {
        "hostname": "10.244.7.6",
        "jdbcUrl": "jdbc:mysql://10.244.7.6:3306/cf_c353ea5a_6720_4db4_9207_235cb9032dee?user=fX5sjC5m4yWxmVEZ\u0026password=ZNvVUJCiUxpMchN3",
        "name": "cf_c353ea5a_6720_4db4_9207_235cb9032dee",
        "password": "ZNvVUJCiUxpMchN3",
        "port": 3306,
        "uri": "mysql://fX5sjC5m4yWxmVEZ:ZNvVUJCiUxpMchN3@10.244.7.6:3306/cf_c353ea5a_6720_4db4_9207_235cb9032dee?reconnect=true",
        "username": "fX5sjC5m4yWxmVEZ"
       },
       "label": "p-mysql",
       "name": "my-app-db",
       "plan": "512mb",
       "tags": [
        "mysql"
       ]
      }
     ]
    }
   }
```

Now, let's try it in our application.

First, you need to have some code in place to use the service.
Go to the `cf-example-sinatra` application that you have cloned before, and do:

```sh
git checkout with-service
```

Now, use your favorite text editor to open the `app.rb` file.
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
