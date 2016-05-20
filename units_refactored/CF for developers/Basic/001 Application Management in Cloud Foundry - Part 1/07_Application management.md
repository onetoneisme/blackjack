### Application management

Cloud Foundry's CLI provides a myriad of options for managing your applications.

#### Listing applications

In the same way that Orgs, Users, and Spaces can be listed, there is an option to list the deployed apps:

```sh
cf apps
```

You will see your application listed in the output.

> **Tip:** `cf apps` will only list applications that were pushed into the *target* (the Org and Space we set before). If you want to list applications in another Org/Space, you need to set the target again with the `cf target` command.

Getting detailed information about the application is as easy as:

```
cf app my-sinatra-app
```
