### Pushing applications

The act of deploying an application to Cloud Foundry is called **pushing**. Therefore, the command that does this is called `push`.

Once logged in, you can simply use the `cf push` command and one parameter (application name) to deploy the source code to Cloud Foundry.

But before that, we need to expand the memory limit of the space quota we created in the previous units. 

```sh
cf update-space-quota small-space-quota -i 2G
```
> **Tip**: You will need to login as the `admin` user, target the parent org, and then update the size of the quota. You may also want to delete the *training* org while logged in as `admin`. After that, you will need to exit and login back as `my-user`.

Once the space quota is updated, you can deploy your application.

```sh
cf push my-sinatra-example
```

The output should be:

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

This short command initiates a series of processes that upload your code to Cloud Foundry, detect the language used, download the corresponding [buildpack](http://docs.cloudfoundry.org/buildpacks/) (we will go deeper into buildpacks further on), and run the necessary scripts and commands to get the libraries used in the application.

To see your first application running, open a browser and navigate to the URL that Cloud Foundry has assigned to it.
