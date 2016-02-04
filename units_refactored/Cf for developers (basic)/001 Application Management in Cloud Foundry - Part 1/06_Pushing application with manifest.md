### Pushing application with manifest

Now, let's reduce the instance memory again, since our application is very small and can run without any issue with 128M. Open the file and change the `memory:` value to `512M`. Save it and push the application again, this time specifying the manifest file:

```
cf push -f my-sinatra-app_manifest.yml
```

Output should be:

```
$ cf push -f my-sinatra-app_manifest.yml
Using manifest file my-sinatra-app_manifest.yml

Updating app my-sinatra-app in org my-org / space my-first-space as my-user...
OK

Using route my-sinatra-app.127.0.0.1.xip.io
Uploading my-sinatra-app...
.
. [lots of output]
.
requested state: started
instances: 1/1
usage: 128M x 1 instances
urls: my-sinatra-app.127.0.0.1.xip.io
last uploaded: [output timestamp]

     state     since                    cpu    memory          disk        details
#0   running   [output timestamp]       0.0%   46.4M of 128M   0 of 128M
```

As you can see, is much more convenient for you to use an application manifest. One more trick for make the code pushing even more easy: rename the `my-sinatra-app_manifest.yml` file to `manifest.yml`.

Then, if you do `cf push`, with no parameter at all, the CLI will pick the `manifest.yml` file automatically.

Go ahead and try it!
