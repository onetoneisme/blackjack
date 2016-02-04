#### Updating services

A service update will upgrade or downgrade the service instance plan.

```
cf update-service my-sinatra-app-db -p 1gb
```

Now your service has been upgraded to the much larger **1gb** plan. You can verify it by doing `cf serice my-sinatra-app-db`.
>**WARNING**: Although the CLI has the update-service command by default, not all services support it. Please check the documentation of the service.
