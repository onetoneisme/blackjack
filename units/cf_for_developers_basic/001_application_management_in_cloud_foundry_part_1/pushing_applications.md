### Pushing applications

The act of deploying an application to Cloud Foundry is called **pushing**. Therefore, the command that does this is called `push`.

Once logged in, you can simply use the `cf push` command and one parameter (application name) to deploy the source code to Cloud Foundry.

```sh
cf push my-sinatra-app
```

This short command initiates a series of processes that upload your code to Cloud Foundry, detect the language used, download the corresponding [buildpack](http://docs.cloudfoundry.org/buildpacks/) (we will go deeper into buildpacks further on), and run the necessary scripts and commands to get the libraries used in the application.

To see your first application running, open a browser and navigate to the URL that Cloud Foundry has assigned to it.
