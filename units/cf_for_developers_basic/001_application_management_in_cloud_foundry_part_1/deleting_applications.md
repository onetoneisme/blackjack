#### Deleting applications

Another command you will find useful is `delete`. It effectively removes an application from Cloud Foundry.

```sh
cf delete my-app
```

> **Tip:** You can always skip the confirmation, using the `-f` flag: `cf delete my-app -f`.

Now, try deleting the `my-sinatra-example` application, forcing the confirmation:

```sh
cf delete my-sinatra-example -f
```
