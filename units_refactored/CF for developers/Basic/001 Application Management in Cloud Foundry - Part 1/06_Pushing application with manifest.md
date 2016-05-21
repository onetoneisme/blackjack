### Pushing an application with a manifest

Now, let's reduce the amount of instance memory again, since our application is very small and can run on 128M without any issues. Open the manifest file and change the `memory:` value to `512M`. Save it and push the application again, this time, specifying the manifest file:

```sh
cf push -f my-sinatra-app_manifest.yml
```

The output should be:

```
$ cf push -f my-sinatra-app_manifest.yml
Using manifest file my-sinatra-app_manifest.yml

Updating app my-sinatra-app in org my-org / space my-first-space as my-user...
OK

Using route my-sinatra-app.{{echo $CF_DOMAIN}}
Uploading my-sinatra-app...
.
. [lots of output]
.
requested state: started
instances: 1/1
usage: 128M x 1 instances
urls: my-sinatra-app.{{echo $CF_DOMAIN}}
last uploaded: [output timestamp]

     state     since                    cpu    memory          disk        details
#0   running   [output timestamp]       0.0%   46.4M of 128M   0 of 128M
```

As you can see, it is much more convenient to use an application manifest for pushing apps.

Here is one more trick to make pushing code even easier: rename the `my-sinatra-app_manifest.yml` file to `manifest.yml`. Then, if you do `cf push` with no parameters at all, the CLI will pick the `manifest.yml` file automatically.

Go ahead and try it!
