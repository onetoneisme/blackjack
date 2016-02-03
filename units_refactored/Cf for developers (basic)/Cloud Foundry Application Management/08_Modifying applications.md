#### Modifying applications

One of the possible scenarios you may run into is that you will need to rename your application. Again, this is VERY simple:

```
cf rename my-sinatra-app my-app
```

Output should be:

```
$ cf rename my-sinatra-app my-app
Renaming app my-sinatra-app to my-app in org my-org / space my-first-space as my-user...
OK
```

Now, if you get the information with `cf app my-app` you will find that the application has been renamed. This, however, will not update your `manifest.yml` or the route (URL) to access your app. What Cloud Foundry has done is to modify the internal name so you can use that name for your CLIs commands.
