#### Renaming services

If you want to change the name of your service, run:

```sh
cf rename-service my-app-db my-sinatra-app-db
```

This will rename your service instance.
>**WARNING**: Beware that, if you are discovering a service instance by its name, you will have to update your code and push your app again.
