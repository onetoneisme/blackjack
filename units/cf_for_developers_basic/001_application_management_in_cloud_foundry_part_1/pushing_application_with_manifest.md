### Pushing an application with a manifest

Now, let's reduce the amount of instance memory again, since our application is very small and can run on 128M without any issues. Open the manifest file and change the `memory:` value to `512M`. Save it and push the application again, this time, specifying the manifest file:

```exec
cd ~/cf-example-sinatra
cf push -f my-sinatra-app_manifest.yml
```

As you can see, it is much more convenient to use an application manifest for pushing apps.

Here is one more trick to make pushing code even easier: rename the `my-sinatra-app_manifest.yml` file to `manifest.yml`. Then, if you do `cf push` with no parameters at all, the CLI will pick the `manifest.yml` file automatically.

Go ahead and try it!
