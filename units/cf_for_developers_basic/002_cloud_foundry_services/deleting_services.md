#### Deleting services

To delete a service, simply use the `delete-service` command:

```exec
cf delete-service my-sinatra-app-db
```

The output should be:

```
$ cf delete-service my-sinatra-app-db -f
Deleting service my-sinatra-app-db in org my-org / space my-first-space as my-user...
FAILED
Cannot delete service instance, apps are still bound to it
```

Hey, what happened? The command failed. Well, this is a safeguard. Cloud Foundry cannot delete a service that is still bound to an app. So, please **do** unbind the service as stated above and then, you can do `cf delete-service my-sinatra-app-db`.

The output should be:

```
$ cf delete-service my-sinatra-app-db

Really delete the service my-sinatra-app-db?> yes
Deleting service my-sinatra-app-db in org my-org / space my-first-space as my-user...
OK
```

There you go!

Now, as a little exercise, please create the `my-app-db` service instance again with the **512mb** plan and bind it to the `my-app` application.
