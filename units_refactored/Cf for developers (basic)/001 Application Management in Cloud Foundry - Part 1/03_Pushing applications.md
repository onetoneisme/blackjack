### Pushing applications

The action of deploying an application to Cloud Foundry receives the name of **pushing**. Therefore, the command to do this is `push`.

Once you are logged in, simply use the command `cf push` to deploy the source code to Cloud Foundry, with 1 parameter only: how do you want this application to be named.

But first, we need to expand the memory limit of the space quota we created in the previous units.

```
cf update-space-quota small-space-quota -i 2G
```
> **Tip**: You will need to login as the *admin* user, target the containing Org and then update the size of the quota. Then, you will need to login back again as *my-user*. Also, while you are logged in as *admin*, you could delete the *training* Org.

Once the space quota is updated, you can deploy your application.

```
cf push my-sinatra-example
```

Output should be:

```
Creating app my-sinatra-app in org my-org / space my-first-space as my-user...
OK

Creating route my-sinatra-app.127.0.0.1.xip.io...
OK

Binding my-sinatra-app.127.0.0.1.xip.io to my-sinatra-app...
OK

Uploading my-sinatra-app...
.
. [lots of output]
.
requested state: started
instances: 1/1
usage: 256M x 1 instances
urls: my-sinatra-app.127.0.0.1.xip.io
last uploaded: [push timestamp]

     state     since                    cpu    memory          disk      details
#0   running   [original timestamp]     0.0%   46.8M of 256M   0 of 1G
```

This little command will initiate a series of processes that will upload your code to Cloud Foundry, detect the language used download the corresponding [buildpack](http://docs.cloudfoundry.org/buildpacks/) (we will go deep into buildpacks further on) and run the necessary scripts and commands to get the libraries used in the application.

If you open a browser and navigate to the URL that Cloud Foundry assigned to this application, you will see your first application running.
