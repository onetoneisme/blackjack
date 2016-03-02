### Application management

Cloud Foundry's CLI provides a myriad of options to manage your applications.

#### Listing applications

In the same way that Orgs, Users and Spaces can be listed, there is an option to list our deployed apps:

```sh
cf apps
```

You will see your application listed there.

> **Tip:** `cf apps` will only list applications that were pushed into the *target* (the Org and Space we sat before). If you want to list applications in another org/space, you need to set the target again with the `cf target` command.

Also, getting detailed information about the application is as easy as:

```
cf app my-sinatra-app
```
