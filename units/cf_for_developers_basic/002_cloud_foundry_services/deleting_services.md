#### Deleting services

To delete a service, simply use the `delete-service` command:

```
cf delete-service my-sinatra-app-db
```

Hey, what happened? The command failed. Well, this is a safeguard. Cloud Foundry cannot delete a service that is still bound to an app. So, please **do** unbind the service as stated above and then, you can do `cf delete-service my-sinatra-app-db`. The  proper command sequence is:

```exec
cf unbind-service my-app my-sinatra-app-db
cf delete-service my-sinatra-app-db
```

There you go!

Now, as a little exercise, please create the `my-app-db` service instance again with the **512mb** plan and bind it to the `my-app` application.
