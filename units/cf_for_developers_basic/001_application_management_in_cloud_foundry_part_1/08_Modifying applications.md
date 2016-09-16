#### Modifying applications

One of the possible scenarios you may run into is that you will need to rename your application. Again, this is *very* simple:

```
cf rename my-sinatra-app my-app
```

The output should be:

```
$ cf rename my-sinatra-app my-app
Renaming app my-sinatra-app to my-app in org my-org / space my-first-space as my-user...
OK
```

Now, if you run the `cf app my-app` command, you will see that the application has been renamed. This, however, will not update your `manifest.yml` or the route (URL) to access your app. What Cloud Foundry does here is modify the internal name, so you can use that name in your CLI commands.
