### Pushing applications

The action of deploying an application to Cloud Foundry receives the name of **pushing**. Therefore, the command to do this is `push`.

Once you are logged in, simply use the command `cf push` to deploy the source code to Cloud Foundry, with 1 parameter only: how do you want this application to be named.

```sh
cf push my-sinatra-example
```

Output should be:

```
Creating app my-sinatra-app in org my-org / space my-first-space as my-user...
OK

Creating route my-sinatra-app.{{echo $CF_DOMAIN}}...
OK

Binding my-sinatra-app.{{echo $CF_DOMAIN}} to my-sinatra-app...
OK

Uploading my-sinatra-app...
.
. [lots of output]
.
requested state: started
instances: 1/1
usage: 256M x 1 instances
urls: my-sinatra-app.{{echo $CF_DOMAIN}}
last uploaded: [push timestamp]

     state     since                    cpu    memory          disk      details
#0   running   [original timestamp]     0.0%   46.8M of 256M   0 of 1G
```

This little command will initiate a series of processes that will upload your code to Cloud Foundry, detect the language used download the corresponding [buildpack](http://docs.cloudfoundry.org/buildpacks/) (we will go deep into buildpacks further on) and run the necessary scripts and commands to get the libraries used in the application.

If you open a browser and navigate to the URL that Cloud Foundry assigned to this application, you will see your first application running.
