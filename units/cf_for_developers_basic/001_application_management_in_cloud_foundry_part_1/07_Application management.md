### Application management

Cloud Foundry's CLI provides a myriad of options for managing your applications.

#### Listing applications

In the same way that orgs, users, and spaces can be listed, there is an option to list the deployed apps:

```sh
cf apps
```

You will see your application listed in the output.

> **Tip:** `cf apps` will only list applications that were pushed into the *target* (the org and space we have set before). If you want to list applications in another org/space, you will need to set the target again with the `cf target` command.

Getting detailed information about the application is as easy as:

```
cf app my-sinatra-app
```
