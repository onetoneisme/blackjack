#### Deleting applications

Another command you will find useful is `delete`. It effectively removes an application from Cloud Foundry.

```sh
cf delete my-app
```

The output should be:

```
$ cf delete my-app

Really delete the app my-app?> yes
Deleting app my-app in org my-org / space my-first-space as my-user...
OK
```

> **Tip:** You can always skip the confirmation, using the `-f` flag: `cf delete my-app -f`.

Now, try deleting the `my-sinatra-example` application, forcing the confirmation:

```sh
cf delete my-sinatra-example -f
```
